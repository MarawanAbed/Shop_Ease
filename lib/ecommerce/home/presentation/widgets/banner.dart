import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce/ecommerce/home/data/models/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/cached_image.dart';

class BannerLogo extends StatelessWidget {
  const BannerLogo({
    super.key,
    required this.banners,
  });

  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Swiper(
        itemCount: banners.length,
        itemBuilder: (BuildContext context, int index) {
          var banner = banners[index];
          return CachedImage(image: banner.image!);
        },
        pagination: const SwiperPagination(),
      ),
    );
  }
}

