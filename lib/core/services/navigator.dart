import 'package:flutter/material.dart';

class Navigators {

  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

 static Future<dynamic> pushNamed(String routeName, {dynamic arguments}) async {
   print('routeName: $routeName');
    return navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {dynamic arguments}) {
    print('routeName: $routeName');
    return navigationKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static Future<dynamic> pushReplacementNamed(String routeName,
      {dynamic arguments}) {
    print('routeName: $routeName');
    return navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void pop({dynamic result}) {
    return navigationKey.currentState!.pop(result);
  }

  static void goBackUntil(String routeName) {
    return navigationKey.currentState!
        .popUntil(ModalRoute.withName(routeName));
  }
}