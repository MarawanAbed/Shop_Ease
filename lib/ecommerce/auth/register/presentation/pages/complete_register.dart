import 'package:flutter/material.dart';

import '../widgets/complete_register_body.dart';

class CompleteRegisterPage extends StatelessWidget {
  const CompleteRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: CompleteRegisterBody(),
        ),
      ),
    );
  }
}
