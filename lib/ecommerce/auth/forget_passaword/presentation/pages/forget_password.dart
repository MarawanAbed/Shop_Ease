import 'package:ecommerce/ecommerce/auth/forget_passaword/presentation/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: ForgetPasswordBody(),
          ),
        ),
      ),
    );
  }
}
