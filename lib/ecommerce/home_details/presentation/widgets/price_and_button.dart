import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/presentation/bloc/add_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/widgets/elevated_button.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Price: \$${totalPrice.toInt()}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomElevatedButton(
          title: '+ Add to Cart',
          onPressed: () async {
            var cubit = context.read<AddCartCubit>();
            bool isAlreadyInCart = await cubit.isAlreadyInCart(cartModel.id);
            if (isAlreadyInCart) {
              HelperMethod.showErrorToast('Item is already in the cart',
                  gravity: ToastGravity.BOTTOM);
            } else {
              cubit.addCart(cartModel);
              HelperMethod.showSuccessToast('Added to cart',
                  gravity: ToastGravity.BOTTOM);
            }
          },
          width: 170.w,
        ),
      ],
    );
  }
}
