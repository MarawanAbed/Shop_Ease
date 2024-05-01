import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/elevated_button.dart';

class PriceAndButton extends StatelessWidget {
  const PriceAndButton({
    super.key,
    required this.totalPrice,
  });

  final double totalPrice;

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
          onPressed: () {},
          width: 170.w,
        ),
      ],
    );
  }
}
