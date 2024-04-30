import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../favorites/presentation/pages/categories_page.dart';
import '../../../favorites/presentation/pages/favorite_page.dart';
import '../../../favorites/presentation/pages/settings_page.dart';
import '../widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget>screens = [
    const HomeBody(),
    const CategoriesPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _currentIndex==0||_currentIndex==1? PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: AppBar(
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 10,
              title: Row(
                children: [
                  Logo(
                    height: 50.h,
                    width: 50.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Shop Ease',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    Navigators.pushNamed(Routes.cart);
                  },
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ):null,
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.orange,
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
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
