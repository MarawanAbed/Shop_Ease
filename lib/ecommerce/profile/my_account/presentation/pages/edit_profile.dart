import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/ecommerce/profile/my_account/data/models/my_account.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/update_user_data_cubit.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/widgets/change_profile_image.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/widgets/edit_profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late MyAccountModel myAccountModel;

  @override
  void didChangeDependencies() {
    myAccountModel =
        ModalRoute.of(context)?.settings.arguments as MyAccountModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await _saveChanges();
                },
              ),
            ],
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ChangeProfileImage(
                        viewOnly: false,
                        image: myAccountModel.image ??
                            'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EditProfileTextField(user: myAccountModel),
                  const SizedBox(
                    height: 20,
                  ),
                  const ImageBLocListener(),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> _saveChanges() async {
    var cubit = context.read<UpdateUserDataCubit>();
    var uId = getIt<AuthService>().getCurrentUserId();
    String? image;
    if (cubit.profileImage != null) {
      await cubit.uploadImageMethod();
      if (cubit.imageUrl != null) {
        image = cubit.imageUrl;
      }
    }
    final user = MyAccountModel(
      uId: uId,
      name: cubit.nameController.text ?? myAccountModel.name,
      email: cubit.emailController.text ?? myAccountModel.email,
      image: image ?? myAccountModel.image,
      password: cubit.passwordController.text ?? myAccountModel.password,
      dataSource: myAccountModel.dataSource,
      address: cubit.addressController.text ?? myAccountModel.address,
      phone: cubit.phoneController.text ?? myAccountModel.phone,
    );

    if (cubit.emailController.text != myAccountModel.email ||
        cubit.passwordController.text != myAccountModel.password) {
      print('${cubit.emailController.text} + ${myAccountModel.email}');
      print('${cubit.passwordController.text} + ${myAccountModel.password}');
      await cubit.updateEmailAndPassword(cubit.emailController.text,
          cubit.passwordController.text, myAccountModel.password);
      cubit.updateUser(user.toJson());
      HelperMethod.showSuccessToast('Profile Updated Successfully',
          gravity: ToastGravity.BOTTOM);
    } else {
      cubit.updateUser(user.toJson());
      HelperMethod.showSuccessToast('Profile Updated',
          gravity: ToastGravity.BOTTOM);
    }
  }
}

class ImageBLocListener extends StatelessWidget {
  const ImageBLocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserDataCubit, UpdateUserDataState>(
      listener: (context, state) {
        state.whenOrNull(
          imageInitial: () {
            HelperMethod.showLoadingDialog(context);
          },
          imageError: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message);
          },
          imageLoaded: () {
            Navigator.pop(context);
          },
          loading: () {
            HelperMethod.showLoadingDialog(context);
          },
          loaded: () {
            Navigator.pop(context);
            Navigators.pop();
          },
          error: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}