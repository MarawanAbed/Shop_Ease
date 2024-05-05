import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/di/dependancy_injection.dart';
import '../../../../core/services/firebase_servies.dart';
import '../widgets/cart_body.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final formKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var uId = getIt<AuthService>().getCurrentUserId();
    var valueListenable = Hive.box<CartModel>('cart_$uId').listenable();
    return SafeArea(
      child: Scaffold(
        key: formKey,
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
                              '\$${value.values.map((e) => e.price * e.quantity).reduce((value, element) => value + element).toInt()}',
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
                    onPressed: () async {
                      //2-init payment sheet
                      await Stripe.instance.initPaymentSheet(
                        paymentSheetParameters:
                            const SetupPaymentSheetParameters(
                          // Set to true for custom flow
                          customFlow: false,
                          customerEphemeralKeySecret:
                              'ek_test_YWNjdF8xT0ZmeG5JQWdvRzY5N0VvLGlSWVpKeXpZWE1vT0NXMkFVM010NHZZT0ZqSUFQTk0_00JIeczVg7',
                          customerId: 'cus_PvTQyWFpHIQoSN',
                          // Main params
                          merchantDisplayName: 'Marwan',
                          paymentIntentClientSecret:
                              'pi_3PCv27IAgoG697Eo1bgaTccS_secret_AB608NMkPD1uHTtjb3Zsensjs',
                        ),
                      );
                      //3-display payment sheet
                      await Stripe.instance.presentPaymentSheet();
                    },
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
