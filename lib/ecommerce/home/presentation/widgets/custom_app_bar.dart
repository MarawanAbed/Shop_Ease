import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/logo.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.lang,
  });

  final S lang;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 10,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Logo(
                height: 60,
                width: 60,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              lang.shop_ease,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigators.pushNamed(Routes.search);
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigators.pushNamed(Routes.cart);
            },
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
