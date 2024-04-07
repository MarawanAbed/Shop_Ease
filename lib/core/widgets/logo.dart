import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/icons.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width, this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.logoSv,
      width: width?? 200.w,
      height: height?? 200.h,
    );
  }
}
