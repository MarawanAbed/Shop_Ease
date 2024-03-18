import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/ecommerce/auth/presentation/pages/login_page.dart';
import 'package:ecommerce/ecommerce/auth/presentation/pages/translate.dart';
import 'package:ecommerce/ecommerce/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final routes = <String, Widget Function(BuildContext)>{
    Routes.onBoarding: (context) => const OnBoardingPage(),
    Routes.translate: (context) => const TranslatePage(),
    Routes.login: (context) => const LoginPage(),
  };
}
