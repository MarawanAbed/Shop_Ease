import 'package:ecommerce/core/widgets/cached_image.dart';
import 'package:ecommerce/ecommerce/home/data/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/services/navigator.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.categories,
    required this.language,
  });

  final CategoriesModel categories;
  final String language;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigators.pushNamed(Routes.productsByCategories,
            arguments: {'id': categories.id, 'name': categories.name, 'language': language,});
      },
      child: Stack(
        children: [
          SizedBox(
            height: 200.h,
            width: 200.w,
            child: CachedImage(image: categories.image ?? ''),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    categories.name ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
