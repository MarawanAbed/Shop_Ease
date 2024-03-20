import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/text_navigator.dart';
import '../../../../generated/l10n.dart';

class Footer extends StatelessWidget {
  const Footer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.routes});

  final String title;
  final String subTitle;
  final String routes;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Column(
      children: [
        TextNavigator(
          title: title,
          subTitle: subTitle,
          routes: routes,
        ),
        SizedBox(
          height: 30.h,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Text(
          lang.or,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.google),
              color: Colors.red,
            ),
            SizedBox(
              width: 20.w,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.twitter),
              color: Colors.blue,
            ),
            SizedBox(
              width: 20.w,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.github),
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
