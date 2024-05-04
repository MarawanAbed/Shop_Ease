import 'package:ecommerce/core/widgets/products_items.dart';
import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:flutter/material.dart';

class HomeProductsListView extends StatelessWidget {
  const HomeProductsListView({super.key, required this.products, required this.language});

  final List<HomeProductModel> products;
  final String language;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ProductsItems(
        product: products[index],
        language: language,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: products.length,
    );
  }
}
