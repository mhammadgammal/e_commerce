import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/home/presentation/widgets/network_image_with_rounded_corner.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/banner_entity/banner_model.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key, required this.banners, this.changeIndex});

  final List<BannerModel> banners;
  final void Function(int index, CarouselPageChangedReason reason)? changeIndex;

  @override
  Widget build(BuildContext context) {
    return // Banner
        CarouselSlider(
      items: List.generate(
        banners.length,
        (index) =>
            NetworkImageWithRoundedCorner(imageUrl: banners[index].image),
      ),
      options: CarouselOptions(
        aspectRatio: 16.0 / 9.0,
        viewportFraction: 0.9,
        autoPlay: true,
        onPageChanged: changeIndex,
      ),
    );
  }
}
