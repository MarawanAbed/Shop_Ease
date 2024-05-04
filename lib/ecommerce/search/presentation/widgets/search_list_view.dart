import 'package:ecommerce/core/widgets/products_items.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.products, required this.language});

  final List<ProductsByCategoriesProductsModel> products;
  final String language;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => ProductsItems(
          product: products[index],
          language: language,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: products.length,
      ),
    );
  }
}
