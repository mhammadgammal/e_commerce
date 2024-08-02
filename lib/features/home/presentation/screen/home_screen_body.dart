import 'package:e_commerce/features/home/presentation/widgets/ads_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/banners_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/recommended_products_widget.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/banner_entity/banner_model.dart';
import '../../domain/entity/product_entity/product_model.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody(
      {super.key,
      required this.ads,
      required this.banners,
      required this.products,
      required this.onFavPressed,
      required this.onCartPressed});

  final String ads;
  final List<BannerModel> banners;
  final List<ProductModel> products;
  final void Function(int, bool) onFavPressed;
  final void Function(int, bool) onCartPressed;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(
          height: 15.0,
        ),
        BannersWidget(banners: banners),
        const SizedBox(
          height: 15.0,
        ),
        AdsWidget(ads),
        RecommendedProducts(
          title: 'Recommended For You',
          products: products,
          onItemPressed: (product) {},
          onFavPressed: onFavPressed,
          onCartPressed: onCartPressed,
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
