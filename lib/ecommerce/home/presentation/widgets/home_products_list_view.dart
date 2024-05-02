import 'package:ecommerce/core/widgets/products_items.dart';
import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:flutter/material.dart';

class HomeProductsListView extends StatelessWidget {
  const HomeProductsListView({super.key, required this.products});

  final List<HomeProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ProductsItems(
        product: products[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: products.length,
    );
  }
}
