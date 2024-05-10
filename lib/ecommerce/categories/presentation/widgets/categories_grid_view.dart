import 'package:ecommerce/ecommerce/categories/data/models/categories.dart';
import 'package:ecommerce/ecommerce/categories/presentation/widgets/categories_item.dart';
import 'package:flutter/material.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView(
      {super.key, required this.categories, required this.language});

  final List<CategoryModel> categories;
  final String language;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => CategoriesItem(
        categories: categories[index],
        language: language,
      ),
      itemCount: categories.length,
    );
  }
}
