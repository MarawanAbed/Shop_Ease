import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/product_items.dart';
import 'package:flutter/material.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    super.key, required this.products,
  });

  final List<HomeProductModel>products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 10,right: 5,left: 5),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 20/ 30,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductItems(
          product: products[index],
        );
      },
      itemCount: products.length,
    );
  }
}
