import 'package:e_commerce/core/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/screen_utils.dart';

class NetworkImageWithRoundedCorner extends StatelessWidget {
  const NetworkImageWithRoundedCorner({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          // Added ClipRRect
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            fit: BoxFit.cover,
            imageUrl,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : ShimmerLoading(
                        width: ScreenUtils.getScreenWidth(context) * 0.9,
                        height: 100.0,
                      ),
          ),
        ));
  }
}
