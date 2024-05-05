import 'package:ecommerce/ecommerce/categories/presentation/widgets/categories_bloc_builder.dart';
import 'package:flutter/material.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key, required this.language});

  final String language;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoriesBlocBuilder(
              language: language,
            ),
          ],
        ),
      ),
    );
  }
}
