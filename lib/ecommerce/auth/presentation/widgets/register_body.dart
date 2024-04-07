import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/elevated_button.dart';
import 'package:ecommerce/core/widgets/logo.dart';
import 'package:ecommerce/ecommerce/auth/presentation/widgets/register_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/text_navigator.dart';
import '../../../../generated/l10n.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

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
          const RegisterTextField(),
          SizedBox(
            height: 30.h,
          ),
          CustomElevatedButton(
            title: lang.register,
            width: double.infinity,
            onPressed: () {
              Navigators.pushNamed(Routes.completeRegister);
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          TextNavigator(
            title: lang.alreadyHaveAccount,
            subTitle: lang.login,
            routes: Routes.login,
          ),
        ],
      ),
    );
  }
}
