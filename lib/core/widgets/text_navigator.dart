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
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                Navigators.pushNamed(routes);
              },
              child: Text(
                subTitle,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
