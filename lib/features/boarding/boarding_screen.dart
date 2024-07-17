import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/router/app_navigator.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_images.dart';
import 'package:e_commerce/core/utils/localization/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/cache/cache_helper.dart';
import 'boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  final List<(String, String, String)> pages = [
    (
      AppImages.purchaseOnline,
      AppStrings.purchaseOnline,
      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore'
    ),
    (
      AppImages.trackOrder,
      AppStrings.trackOrder,
      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore'
    ),
    (
      AppImages.getYoutOrder,
      AppStrings.getYourOrder,
      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore'
    ),
  ];
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: widget.pages.length,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == widget.pages.length - 1;
                });
              },
              itemBuilder: (context, index) => OnBoardingItem(
                image: widget.pages[index].$1,
                title: widget.pages[index].$2,
                subtitle: widget.pages[index].$3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
                controller: pageController,
                count: widget.pages.length,
                effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.complementaryColor3)),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: isLastPage,
        child: FloatingActionButton(
          onPressed: () {
            sl<CacheHelper>().putBool(CacheKeys.isBoarding, true);
            AppNavigator.navigateToRegister(context);
          },
          backgroundColor: AppColors.complementaryColor3,
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
