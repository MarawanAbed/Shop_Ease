import 'package:ecommerce/core/helpers/validation.dart';
import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({super.key});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late TextEditingController _emailController;

  late TextEditingController _passwordController;
  bool _obscureText = true;

  @override
  void initState() {
    _emailController = context.read<LoginCubit>().emailController;
    _passwordController = context.read<LoginCubit>().passwordController;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: lang.enterYourEmail,
            controller: _emailController,
            backgroundColor: Colors.white,
            inputTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            validator: (String? email) {
             if( Validation.isEmailValid(email!)) {
               return null;
             } else {
               return lang.enterValidEmail;
             }
            },
            suffixIcon: const Icon(
              Icons.email,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            hintText: lang.enterPassword,
            controller: _passwordController,
            inputTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
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
            validator: (String? password){
              if(Validation.isPasswordValid(password!)){
                return null;
              } else {
                return lang.passwordMustBeAtLeast;
              }
            },
          ),
        ],
      ),
    );
  }
}
