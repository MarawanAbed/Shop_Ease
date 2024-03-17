import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSliders extends StatefulWidget {
  const HomeSliders({Key? key, required this.images}) : super(key: key);

  final List<String>images;
  @override
  _HomeSlidersState createState() => _HomeSlidersState();
}

class _HomeSlidersState extends State<HomeSliders> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: [
            for (var i = 0; i < widget.images.length; i++)
              Image.asset(
                widget.images[i],
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
          ],
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          carouselController: _carouselController,
        ),
        Positioned(
          top: 550,
          left: MediaQuery.of(context).size.width / 2 - 36,
          child: AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: widget.images.length,
            effect: const ExpandingDotsEffect(
              expansionFactor: 4,
              spacing: 8.0,
              radius: 16.0,
              dotWidth: 20.0,
              dotHeight: 20.0,
              dotColor: Colors.grey,
              activeDotColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
