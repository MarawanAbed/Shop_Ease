import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/ecommerce/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:flutter/material.dart';

class AppRoutes
{
 static Route onGenerateRoute(RouteSettings settings)
  {
    switch(settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      default:
        return _defaultRoute(settings);
    }
  }

}

Route _defaultRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    ),
  );
}