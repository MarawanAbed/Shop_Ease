import 'package:ecommerce/ecommerce/categories/presentation/widgets/categories_bloc_builder.dart';
import 'package:flutter/material.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoriesBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
