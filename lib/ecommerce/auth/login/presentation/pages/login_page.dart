import 'package:ecommerce/ecommerce/auth/login/presentation/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: LoginBody(),
          ),
        ),
      ),
    );
  }
}
