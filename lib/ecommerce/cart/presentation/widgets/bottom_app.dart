import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/presentation/bloc/payment_cubit.dart';
import 'package:ecommerce/ecommerce/cart/presentation/widgets/cart_bloc_listener.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BottomApp extends StatelessWidget {
  const BottomApp({
    super.key,
    required this.valueListenable,
    required this.light,
    required this.lang,
  });

  final ValueListenable<Box<CartModel>> valueListenable;
  final bool light;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<CartModel>>(
      valueListenable: valueListenable,
      builder: (BuildContext context, Box<CartModel> value, Widget? child) {
        var total = value.values.isEmpty
            ? 0
            : value.values
                .map((e) => e.price * e.quantity)
                .reduce((value, element) => value + element)
                .toInt();
        return BottomAppBar(
          height: 120,
          color: light ? Colors.white : Colors.grey[800],
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${lang.total} : ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  value.isEmpty
                      ? const Text(
                          '\$ 0',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          '\$ ${total.toString()}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
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
                      await _checkout(context, total);
                    },
                    child: Text(
                      lang.checkout,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              CartBlocListener(
                total: total.toString(),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _checkout(BuildContext context, int total) async {
    var customerUid = await getIt<SharedPreCacheHelper>().getCustomerId();
    var cubit = context.read<PaymentCubit>();
    cubit.paymentIntent(total.toString(), 'usd', customerUid!).then((_) {
      cubit.ephemeralKeyKey(customerUid).then((_) {
        cubit.checkOut(customerUid);
      });
    });
  }
}
