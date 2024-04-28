import 'package:ecommerce/core/helpers/validation.dart';
import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../bloc/register_cubit.dart';


class RegisterTextField extends StatefulWidget {
  const RegisterTextField({super.key});

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  late TextEditingController _emailController ;
  late TextEditingController _passwordController ;
  late TextEditingController _passwordConfirmController ;

  @override
  void initState() {
    var cubit = context.read<RegisterCubit>();
    _emailController = cubit.emailController;
    _passwordController = cubit.passwordController;
    _passwordConfirmController = cubit.confirmPasswordController;
    super.initState();
  }

  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Column(
      children: [
        AppTextFormField(
          hintText: lang.enterYourEmail,
          controller: _emailController,
          backgroundColor: Colors.white,
          validator: (email) => Validation.validateEmail(email!),
          inputTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: const Icon(
            Icons.email,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        AppTextFormField(
          hintText: lang.enterPassword,
          controller: _passwordController,
          inputTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          validator: (password) => Validation.validatePassword(password!),
          isObscureText: _obscureText1,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText1 = !_obscureText1;
              });
            },
            icon: Icon(
              _obscureText1 ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        AppTextFormField(
          hintText: lang.confirmPassword,
          controller: _passwordConfirmController,
          validator: (password)=> Validation.validateConfirmPassword(_passwordController.text,password!),
          inputTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          isObscureText: _obscureText2,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText2 = !_obscureText2;
              });
            },
            icon: Icon(
              _obscureText2 ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
