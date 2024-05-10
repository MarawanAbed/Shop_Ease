import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/presentation/bloc/add_cart_cubit.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PriceAndButton extends StatelessWidget {
  const PriceAndButton({
    super.key,
    required this.totalPrice,
    required this.cartModel,
  });

  final double totalPrice;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '${lang.price}: \$${totalPrice.toInt()}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                var cubit = context.read<AddCartCubit>();
                bool isAlreadyInCart =
                    await cubit.isAlreadyInCart(cartModel.id);
                if (isAlreadyInCart) {
                  HelperMethod.showErrorToast(lang.item_already_in_cart,
                      gravity: ToastGravity.BOTTOM);
                } else {
                  cubit.addCart(cartModel);
                  HelperMethod.showSuccessToast(lang.added_to_cart,
                      gravity: ToastGravity.BOTTOM);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: FittedBox(
                child: Text(
                  lang.add_to_cart,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
