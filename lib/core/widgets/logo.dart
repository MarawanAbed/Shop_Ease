import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/icons.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.logoSv,
      width: 200.w,
      height: 200.h,
    );
  }
}
