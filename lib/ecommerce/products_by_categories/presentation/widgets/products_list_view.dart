import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';
import 'package:ecommerce/core/widgets/products_items.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});

  final List<ProductsByCategoriesProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => ProductsItems(
        product: products[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: products.length,
    );
  }
}
