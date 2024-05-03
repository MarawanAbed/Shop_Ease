import 'package:ecommerce/ecommerce/home/presentation/widgets/banner_bloc_builder.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/product_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categories_bloc_builder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BannerBlocBuilder(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CategoriesBlocBuilder(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ProductBlocBuilder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

