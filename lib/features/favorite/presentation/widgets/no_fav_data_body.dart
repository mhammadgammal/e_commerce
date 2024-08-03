import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/theme/app_images.dart';

class NoFavDataBody extends StatelessWidget {
  const NoFavDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(AppImages.noCartData),
        const Text(
          'No items in your wishlist, Let\'s have shopping',
          style: AppTextStyle.font20BlackBold,
        ),
      ],
    );
  }
}
