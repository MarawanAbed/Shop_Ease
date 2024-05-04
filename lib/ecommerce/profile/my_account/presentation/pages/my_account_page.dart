import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/get_single_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/routes.dart';
import '../widgets/my_account_bloc_builder.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  void initState() {
    context.read<GetSingleUserCubit>().getSingleUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              var cubit = context.read<GetSingleUserCubit>();
              Navigators.pushNamed(Routes.editProfile,arguments: cubit.myAccountModel);
            },
          ),
        ],
        title: const Text(
          'My Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              MyAccountBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}

//                        var cubit = context.read<UpdateUserDataCubit>();
//                         var auth = getIt<AuthService>().auth;
//                         var user =
//                             context.read<GetSingleUserCubit>().myAccountModel;
//                         print('user ${user.name}');
//                         if (cubit.formKey.currentState!.validate()) {
//                           if (cubit.profileImage != null) {
//                             await cubit.uploadImageMethod();
//                             if (cubit.imageUrl != null) {
//                               if (cubit.emailController.text != user.email ||
//                                   cubit.passwordController.text !=
//                                       user.password) {
//                                 auth.currentUser!.updateEmail(cubit.emailController.text);
//                                 auth.currentUser!.updatePassword(
//                                   cubit.passwordController.text,
//                                 );
//                                 cubit.updateUser(MyAccountModel(
//                                   uId: auth.currentUser?.uid,
//                                   name: nameController.text ?? user.name,
//                                   email: emailController.text ?? user.email,
//                                   password:
//                                       passwordController.text ?? user.password,
//                                   phone: phoneController.text ?? user.phone,
//                                   image: cubit.imageUrl ?? user.image,
//                                   dataSource: user.dataSource,
//                                   address:
//                                       addressController.text ?? user.address,
//                                 ).toJson());
//                                 HelperMethod.showSuccessToast(
//                                     'Data Updated Successfully, login again',
//                                     gravity: ToastGravity.BOTTOM);
//                                 auth.signOut();
//                               } else {
//                                 cubit.updateUser(
//                                   MyAccountModel(
//                                     uId: auth.currentUser?.uid,
//                                     name: nameController.text ?? user.name,
//                                     email: user.email,
//                                     password: user.password,
//                                     phone: phoneController.text ?? user.phone,
//                                     image: cubit.imageUrl ?? user.image,
//                                     dataSource: user.dataSource,
//                                     address:
//                                         addressController.text ?? user.address,
//                                   ).toJson(),
//                                 );
//                                 HelperMethod.showSuccessToast(
//                                     'Data Updated Successfully',
//                                     gravity: ToastGravity.BOTTOM);
//                                 Navigator.pop(context);
//                               }
//                             } else {
//                               cubit.updateUser(
//                                 MyAccountModel(
//                                   uId: auth.currentUser?.uid,
//                                   name: nameController.text == null
//                                       ? user.name
//                                       : nameController.text,
//                                   email: emailController.text == null
//                                       ? user.email
//                                       : emailController.text,
//                                   password: passwordController.text == null
//                                       ? user.password
//                                       : passwordController.text,
//                                   phone: phoneController.text == null
//                                       ? user.phone
//                                       : phoneController.text,
//                                   image: cubit.imageUrl ?? user.image,
//                                   dataSource: user.dataSource,
//                                   address: addressController.text == null
//                                       ? user.address
//                                       : addressController.text,
//                                 ).toJson(),
//                               );
//                               HelperMethod.showSuccessToast(
//                                   'Data Updated Successfully',
//                                   gravity: ToastGravity.BOTTOM);
//                               Navigator.pop(context);
//                             }
//                           } else {
//                             HelperMethod.showErrorToast(
//                                 'Please select image again',
//                                 gravity: ToastGravity.BOTTOM);
//                           }
//                         } else {
//                           HelperMethod.showErrorToast('Please fill all fields',
//                               gravity: ToastGravity.BOTTOM);
//                         }
