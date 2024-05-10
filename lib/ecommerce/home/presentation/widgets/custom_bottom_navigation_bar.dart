import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.lang, required this.onTap});

  final int currentIndex;
  final S lang;
  final Function(int) onTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _currentIndex ;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
          label: widget.lang.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.category),
          label: widget.lang.categories,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: widget.lang.favorite,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: widget.lang.profile,
        ),
      ],
    );
  }
}