import 'package:ecommerce/ecommerce/home_details/presentation/widgets/star_and_counter.dart';
import 'package:flutter/material.dart';

import '../../../home_details/data/models/product.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo(
      {super.key,
        required this.product,
        required this.counter,
        required this.onCounterChanged});

  final HomeDetailsProductModel product;

  final int counter;
  final ValueChanged<int> onCounterChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        StarAndCounter(
          counter: counter,
          onCounterChanged: onCounterChanged,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Description : ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          product.description,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
