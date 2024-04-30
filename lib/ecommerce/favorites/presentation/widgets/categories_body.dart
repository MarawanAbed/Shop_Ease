import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            // GridView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //   ),
            //   // itemBuilder: (context, index) => const CategoryItems(),
            //   itemCount: 7,
            // ),
          ],
        ),
      ),
    );
  }
}
