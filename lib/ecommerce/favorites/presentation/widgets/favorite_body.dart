import 'package:ecommerce/core/widgets/products_items.dart';
import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => SizedBox(
                height: 150,
                child: ProductsItems(
                  product: HomeProductModel(
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
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: 4,
            ),
          )
        ],
      ),
    );
  }
}

