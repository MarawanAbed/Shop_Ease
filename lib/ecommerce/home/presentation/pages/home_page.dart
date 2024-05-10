import 'package:ecommerce/ecommerce/home/presentation/widgets/custom_app_bar.dart';
import 'package:ecommerce/ecommerce/profile/presentation/pages/profile_page.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../categories/presentation/pages/categories_page.dart';
import '../../../favorites/presentation/pages/favorite_page.dart';
import '../widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> screens = [
    const HomeBody(),
    const CategoriesPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _currentIndex == 0 || _currentIndex == 1
            ? PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: CustomAppBar(lang: lang),
              )
            : null,
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: lang.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.category),
              label: lang.categories,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: lang.favorite,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: lang.profile,
            ),
          ],
        ),
      ),
    );
  }
}
