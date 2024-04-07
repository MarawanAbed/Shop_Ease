import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/ecommerce/auth/presentation/pages/complete_register.dart';
import 'package:ecommerce/ecommerce/auth/presentation/pages/forget_password.dart';
import 'package:ecommerce/ecommerce/auth/presentation/pages/login_page.dart';
import 'package:ecommerce/ecommerce/auth/presentation/pages/register_page.dart';
import 'package:ecommerce/ecommerce/auth/presentation/pages/translate.dart';
import 'package:ecommerce/ecommerce/home/presentation/pages/cart_page.dart';
import 'package:ecommerce/ecommerce/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:flutter/material.dart';

import '../../ecommerce/home/presentation/pages/home_details.dart';
import '../../ecommerce/home/presentation/pages/home_page.dart';

class AppRoutes {
  static final routes = <String, Widget Function(BuildContext)>{
    Routes.onBoarding: (context) => const OnBoardingPage(),
    Routes.translate: (context) => const TranslatePage(),
    Routes.login: (context) => const LoginPage(),
    Routes.register: (context) => const RegisterPage(),
    Routes.completeRegister: (context) => const CompleteRegisterPage(),
    Routes.forgotPassword: (context) => const ForgetPasswordPage(),
    Routes.home: (context) => const HomePage(),
    Routes.homeDetails: (context) => const HomeDetailsPage(),
    Routes.cart:(context) => const CartPage(),
  };
}
