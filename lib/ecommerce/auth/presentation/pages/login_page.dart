import 'package:ecommerce/ecommerce/auth/presentation/widgets/login_body.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).login),
        ),
        body: const LoginBody(),
      ),
    );
  }
}
