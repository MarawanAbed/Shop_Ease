import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/cache.dart';
import '../../../../core/utils/strings.dart';

class OnBoardingItems extends StatelessWidget {
  const OnBoardingItems(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.currentPage,
      required this.controller,
      required this.length});

  final String image;
  final String title;
  final String subTitle;
  final double currentPage;
  final PageController controller;
  final int length;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () async {
                        Navigators.pushNamedAndRemoveUntil(Routes.translate);
                        await getIt<SharedPreCacheHelper>()
                            .saveData(key: AppStrings.onboardingKey, value: true);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyles.skipTextStyle,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  image,
                  width: double.infinity,
                ),
                const Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyles.titleTextStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style:TextStyles.subTitleTextStyle,
                ),
                const Spacer(),
                DotsIndicator(
                  dotsCount: length,
                  position: currentPage,
                  decorator: const DotsDecorator(
                    activeColor: Colors.orange,
                  ),
                ),
                const Spacer(),
                buildElevatedButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (currentPage < (length - 1)) {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          } else {
            Navigators.pushNamedAndRemoveUntil(Routes.translate);
            await getIt<SharedPreCacheHelper>()
                .saveData(key: AppStrings.onboardingKey, value: true);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 50.w,
            vertical: 20.h,
          ),
        ),
        child: Text(
          currentPage < (length - 1) ? 'Next' : 'Get Started',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
