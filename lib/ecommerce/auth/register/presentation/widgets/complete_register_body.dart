import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/services/navigator.dart';
import '../../../../../core/widgets/elevated_button.dart';
import '../../../../../core/widgets/logo.dart';
import '../../../../../generated/l10n.dart';
import 'complete_register_text_fields.dart';

class CompleteRegisterBody extends StatelessWidget {
  const CompleteRegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Logo(),
          SizedBox(
            height: 30.h,
          ),
          const CompleteRegisterTextField(),
          SizedBox(
            height: 30.h,
          ),
          CustomElevatedButton(
            title: lang.register,
            width: double.infinity,
            onPressed: () {
              Navigators.pushNamed(Routes.home);
            },
          ),
        ],
      ),
    );
  }
}
