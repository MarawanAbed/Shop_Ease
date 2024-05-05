import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/ecommerce/cart/presentation/bloc/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBlocListener extends StatelessWidget {
  const CartBlocListener({super.key, required this.total});
  final String total;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: ()
          {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Payment Successful'),
              ),
            );
            Navigators.pushNamed(Routes.thankYou,arguments: total);
          }
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
