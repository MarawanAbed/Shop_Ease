import 'package:ecommerce/ecommerce/home_details/data/models/product.dart';
import 'package:ecommerce/ecommerce/home_details/presentation/widgets/price_and_button.dart';
import 'package:ecommerce/ecommerce/home_details/presentation/widgets/product_info.dart';
import 'package:ecommerce/ecommerce/home_details/presentation/widgets/slider_image.dart';
import 'package:flutter/material.dart';

class ProductDetailsItems extends StatefulWidget {
  const ProductDetailsItems({
    super.key,
    required this.product,
  });

  final HomeDetailsProductModel product;

  @override
  State<ProductDetailsItems> createState() => _ProductDetailsItemsState();
}

class _ProductDetailsItemsState extends State<ProductDetailsItems> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    double totalPrice =
        widget.product.price * _counter; // calculate total price
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderImage(
          images: widget.product.images,
        ),
        const SizedBox(
          height: 40,
        ),
        ProductInfo(
          product: widget.product,
          counter: _counter,
          onCounterChanged: _updateCounter,
        ),
        PriceAndButton(totalPrice: totalPrice),
      ],
    );
  }

  void _updateCounter(int newCounter) {
    setState(() {
      _counter = newCounter;
    });
  }
}