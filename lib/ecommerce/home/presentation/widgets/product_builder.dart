import 'package:ecommerce/ecommerce/home/presentation/widgets/product_items.dart';
import 'package:flutter/material.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const ProductItems();
      },
      itemCount: 10,
    );
  }
}
