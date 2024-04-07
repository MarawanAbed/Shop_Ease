import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/navigator.dart';

class TextNavigator extends StatelessWidget {
  const TextNavigator({
    super.key,
    required this.title,
    required this.subTitle,
    required this.routes,
  });

  final String title;
  final String subTitle;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: subTitle,
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigators.pushNamed(routes);
              },
          ),
        ],
      ),
    );
  }
}
