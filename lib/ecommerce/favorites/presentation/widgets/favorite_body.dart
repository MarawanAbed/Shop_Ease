import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/product_items.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) =>  ProductItems(
                product: ProductModel(
                  id: 1,
                  price: 12345,
                  oldPrice: 12345,
                  discount: 12345,
                  image: 'assets/images/1.png',
                  description: 'description',
                  images: ['assets/images/1.png'],
                  name: 'name',
                ),
              ),
              itemCount: 7,
            ),
          ],
        ),
      ),
    );
  }
}
