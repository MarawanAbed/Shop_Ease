import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:ecommerce/ecommerce/profile/my_account/data/models/my_account.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/update_user_data_cubit.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileTextField extends StatefulWidget {
  const EditProfileTextField({super.key, required this.user});
  final MyAccountModel user;
  @override
  State<EditProfileTextField> createState() => _EditProfileTextFieldState();
}

class _EditProfileTextFieldState extends State<EditProfileTextField> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  @override
  void initState() {
    var cubit= context.read<UpdateUserDataCubit>();
    nameController = cubit.nameController;
    emailController = cubit.emailController;
    passwordController = cubit.passwordController;
    phoneController = cubit.phoneController;
    addressController = cubit.addressController;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var lang=S.of(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          lang.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        AppTextFormField(
          controller: nameController..text = widget.user.name,
          inputTextStyle: const TextStyle(
            color:Colors.black,
          ),
          hintStyle: const TextStyle(
            color:Colors.black,
          ),
          hintText: lang.name,
        ),
        const SizedBox(height: 16),
         Text(
          lang.email,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        AppTextFormField(
          controller: emailController..text = widget.user.email,
          inputTextStyle: const TextStyle(
            color:Colors.black,
          ),
          hintStyle: const TextStyle(
            color:Colors.black,
          ),
          hintText: lang.email,
        ),
        const SizedBox(height: 16),
         Text(
           lang.password,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        AppTextFormField(
          controller: passwordController..text = widget.user.password,
          inputTextStyle: const TextStyle(
            color:Colors.black,
          ),
          hintStyle: const TextStyle(
            color:Colors.black,
          ),
          hintText: lang.password,
        ),
        const SizedBox(height: 16),
         Text(
          lang.phone,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        AppTextFormField(
          controller: phoneController..text = widget.user.phone,
          inputTextStyle: const TextStyle(
            color:Colors.black,
          ),
          hintStyle: const TextStyle(
            color:Colors.black,
          ),
          hintText: lang.phone,
        ),
        const SizedBox(height: 16),
         Text(
          lang.address,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        AppTextFormField(
          controller: addressController..text = widget.user.address,
          inputTextStyle: const TextStyle(
            color:Colors.black,
          ),
          hintStyle: const TextStyle(
            color:Colors.black,
          ),
          hintText: lang.address,
        ),
      ],
    );

  }
}