import 'package:ecommerce/core/helpers/validation.dart';
import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';


class RegisterTextField extends StatefulWidget {
  const RegisterTextField({super.key});

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  bool _obscureText = false;

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
          isObscureText: _obscureText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
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
          validator: (password) => Validation.validateConfirmPassword(
              password!, _passwordConfirmController.text),
          inputTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          isObscureText: _obscureText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
