import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/features/boarding/boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> generateRoute = {
    RouterHelper.onBoarding: (_) => OnBoardingScreen(),
  };
}
