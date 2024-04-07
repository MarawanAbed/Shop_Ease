import 'package:ecommerce/ecommerce/auth/presentation/widgets/register_body.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: RegisterBody(),
          ),
        ),
      ),
    );
  }
}
