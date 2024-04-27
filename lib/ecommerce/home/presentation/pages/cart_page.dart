import 'package:ecommerce/core/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Cart',
          ),
        ),
        body: const CartBody(),
        bottomNavigationBar: const BottomAppBar(
          height: 120,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Total : ',
                  ),
                  Spacer(),
                  Text(
                    '\$250',
                  ),
                ],
              ),
              Spacer(),
              CustomElevatedButton(
                title: 'CheckOut',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
