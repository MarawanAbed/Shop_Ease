import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/di/dependancy_injection.dart';
import '../../../../core/services/firebase_servies.dart';
import '../widgets/cart_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var uId = getIt<AuthService>().getCurrentUserId();
    var valueListenable = Hive.box<CartModel>('cart_$uId').listenable();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Cart',
          ),
        ),
        body: const CartBody(),
        bottomNavigationBar: BottomAppBar(
          height: 120,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Total : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  ValueListenableBuilder<Box<CartModel>>(
                    valueListenable: valueListenable,
                    builder: (BuildContext context, Box<CartModel> value,
                        Widget? child) {
                      return value.isEmpty
                          ? const Text(
                              '\$ 0',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              '\$${value.values.map((e) => e.price*e.quantity).reduce((value, element) => value + element)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
