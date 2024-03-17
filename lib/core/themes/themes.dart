import 'package:flutter/material.dart';

import 'app_colors.dart';

class Themes {
  static ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: AppColors.kBackGround,
    );
  }
}
