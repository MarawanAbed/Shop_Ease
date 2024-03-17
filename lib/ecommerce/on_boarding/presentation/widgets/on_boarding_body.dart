import 'package:flutter/material.dart';

import '../../data/data_sources/static.dart';
import 'on_boarding_items.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final _controller = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: onBoarding.length,
      itemBuilder: (context, index) {
        return OnBoardingItems(
          image: onBoarding[index].image,
          length: onBoarding.length,
          title: onBoarding[index].title,
          subTitle: onBoarding[index].description,
          controller: _controller,
          currentPage: _currentPage,
        );
      },
    );
  }
}
