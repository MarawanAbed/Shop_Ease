import 'package:ecommerce/core/widgets/logo.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/presentation/bloc/forget_password_cubit.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_text_form.dart';
import '../../../../../core/widgets/elevated_button.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgetPasswordCubit>();
    var lang = S.of(context);
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              lang.enterEmailForget,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AppTextFormField(
              hintText: lang.enterYourEmail,
              controller: _emailController,
              backgroundColor: Colors.white,
              inputTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: const Icon(
                Icons.email,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(
              title: lang.sendEmail,
              width: double.infinity,
              onPressed: () {
                cubit.forgetPassword(_emailController.text.trim());
              },
            ),
          ],
        ),
      ),
    );
  }
}
