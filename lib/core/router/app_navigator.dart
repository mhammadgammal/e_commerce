import 'package:e_commerce/core/router/router_helper.dart';
import 'package:flutter/material.dart';

abstract class AppNavigator {
  static void navigateTtoToLayout(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.root);

  static void navigateToRegister(BuildContext context) =>
      Navigator.pushNamed(context, RouterHelper.register);

  static void navigateAndFinishToLogin(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.login);

  static void navigateToLogin(BuildContext context) =>
      Navigator.pushNamed(context, RouterHelper.login);

  static void navigateAndFinishToHomeScreen(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.home);

  static void navigateToCategoryDetails(context, int categoryId) =>
      Navigator.pushNamed(context, RouterHelper.categoriesDetail,
          arguments: categoryId);

  static void navigateToFavorite(BuildContext context) =>
      Navigator.pushNamed(context, RouterHelper.favorite);
}
