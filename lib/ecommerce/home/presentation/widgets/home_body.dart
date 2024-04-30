import 'package:ecommerce/ecommerce/home/presentation/widgets/banner_bloc_builder.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/categories_bloc_builder.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/product_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
    );
  }
}
