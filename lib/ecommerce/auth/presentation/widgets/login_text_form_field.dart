import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({super.key});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
          inputTextStyle:  TextStyle(
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
          inputTextStyle:  TextStyle(
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
