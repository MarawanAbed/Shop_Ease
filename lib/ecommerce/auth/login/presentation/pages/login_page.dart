import 'package:ecommerce/ecommerce/auth/login/presentation/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String dataSource;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataSource = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as String
        : ' ';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: LoginBody(
              dataSource: dataSource,
            ),
          ),
        ),
      ),
    );
  }
}
