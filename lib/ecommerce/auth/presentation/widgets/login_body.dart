import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/elevated_button.dart';
import 'package:ecommerce/core/widgets/logo.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'footer.dart';
import 'forget_and_remember.dart';
import 'login_text_form_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
          const LoginTextField(),
          SizedBox(
            height: 30.h,
          ),
          const ForgetAndRemember(),
          SizedBox(
            height: 30.h,
          ),
          CustomElevatedButton(
            title: lang.login,
            width: double.infinity,
            onPressed: () {},
          ),
          SizedBox(
            height: 30.h,
          ),
          Footer(
            routes: Routes.register,
            subTitle: lang.register,
            title: lang.dontHaveAccount,
          ),
        ],
      ),
    );
  }
}
