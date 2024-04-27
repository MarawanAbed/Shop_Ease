import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/presentation/pages/forget_password.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/pages/login_page.dart';
import 'package:ecommerce/ecommerce/auth/register/presentation/pages/complete_register.dart';
import 'package:ecommerce/ecommerce/auth/register/presentation/pages/register_page.dart';
import 'package:ecommerce/ecommerce/home/presentation/pages/cart_page.dart';
import 'package:ecommerce/ecommerce/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:ecommerce/ecommerce/translate/presentation/pages/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ecommerce/home/presentation/pages/home_details.dart';
import '../../ecommerce/home/presentation/pages/home_page.dart';

class AppRoutes {
  static final routes = <String, Widget Function(BuildContext)>{
    Routes.onBoarding: (context) => const OnBoardingPage(),
    Routes.translate: (context) => const TranslatePage(),
    Routes.login: (context) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginPage(),
        ),
    Routes.register: (context) => const RegisterPage(),
    Routes.completeRegister: (context) => const CompleteRegisterPage(),
    Routes.forgotPassword: (context) => const ForgetPasswordPage(),
    Routes.home: (context) => const HomePage(),
    Routes.homeDetails: (context) => const HomeDetailsPage(),
    Routes.cart: (context) => const CartPage(),
  };
}
