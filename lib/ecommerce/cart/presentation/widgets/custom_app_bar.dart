import 'package:ecommerce/core/assets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: SvgPicture.asset(
            AppImages.arrow,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}

