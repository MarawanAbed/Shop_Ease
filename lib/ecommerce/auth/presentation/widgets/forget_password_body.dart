import 'package:ecommerce/core/widgets/logo.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_text_form.dart';
import '../../../../core/widgets/elevated_button.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Padding(
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
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          AppTextFormField(
            hintText: lang.enterYourEmail,
            controller: _emailController,
            backgroundColor: Colors.white,
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
            height: 30.h,
          ),
          CustomElevatedButton(
            title: lang.sendEmail,
            width: double.infinity,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
