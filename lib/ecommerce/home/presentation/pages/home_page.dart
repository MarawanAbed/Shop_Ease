import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/logo.dart';
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
