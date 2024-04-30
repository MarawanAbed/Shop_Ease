import 'package:flutter/material.dart';

import '../widgets/categories_body.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CategoriesBody(),
      ),
    );
  }
}
