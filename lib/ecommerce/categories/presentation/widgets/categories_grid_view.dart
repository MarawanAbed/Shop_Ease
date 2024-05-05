import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/cached_image.dart';
import 'package:ecommerce/ecommerce/categories/data/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView(
      {super.key, required this.categories, required this.language});

  final List<CategoryModel> categories;
  final String language;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => CategoriesItem(
        categories: categories[index],
        language: language,
      ),
      itemCount: categories.length,
    );
  }
}

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key, required this.categories, required this.language});

  final CategoryModel categories;
  final String language;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigators.pushNamed(Routes.productsByCategories, arguments: {
          'id': categories.id,
          'name': categories.name,
          'language': language,
        });
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
