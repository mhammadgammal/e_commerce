import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

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
        (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              // Added ClipRRect
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(fit: BoxFit.cover, banners[index].image),
            )),
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
