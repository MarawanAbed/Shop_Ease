import 'package:ecommerce/ecommerce/home/data/models/categories.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/categories_Items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({
    super.key, required this.categories,
  });

  final List<CategoriesModel>categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return  CategoryItems(
            categories: categories[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
