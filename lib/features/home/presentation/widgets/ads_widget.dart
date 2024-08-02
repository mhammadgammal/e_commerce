import 'package:e_commerce/core/widgets/shimmer_loading.dart';
import 'package:e_commerce/features/home/presentation/widgets/network_image_with_rounded_corner.dart';
import 'package:flutter/material.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget(this.ads, {super.key});

  final String ads;
  @override
  Widget build(BuildContext context) {
    print('ads: $ads');
    return SizedBox(
      width: double.infinity,
      height: 200.0,
      child: ads.isEmpty
          ? Container(
              child: const ShimmerLoading(
                width: double.infinity,
                height: 200.0,
              ),
            )
          : NetworkImageWithRoundedCorner(imageUrl: ads),
    );
  }
}
