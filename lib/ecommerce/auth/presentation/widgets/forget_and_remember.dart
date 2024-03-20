import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/services/navigator.dart';
import '../../../../generated/l10n.dart';

class ForgetAndRemember extends StatelessWidget {
  const ForgetAndRemember({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Row(
      children: [
        Row(
          children: [
            Text(
              lang.rememberMe,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigators.pushNamed(Routes.forgotPassword);
          },
          child: Text(
            lang.forgotPassword,
            style: TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.underline,
              decorationColor: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
