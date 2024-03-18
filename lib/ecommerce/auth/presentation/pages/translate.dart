import 'package:ecommerce/ecommerce/auth/presentation/widgets/translate_body.dart';
import 'package:flutter/material.dart';

class TranslatePage extends StatelessWidget {
  const TranslatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: TranslateBody()
      )
    );
  }
}
