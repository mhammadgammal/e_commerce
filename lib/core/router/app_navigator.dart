import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:flutter/material.dart';

abstract class AppNavigator {
  static void navigateTtoToLayout(BuildContext context) =>
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouterHelper.root,
        (Route<dynamic> route) => false,
      );

  static void navigateToRegister(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.register);

  static void navigateAndFinishToLogin(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.login);

  static void navigateToLogin(BuildContext context) =>
      Navigator.pushNamed(context, RouterHelper.login);

  static void navigateAndFinishToHomeScreen(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.home);

  static void navigateToCategoryDetails(context, int categoryId) =>
      Navigator.pushNamed(context, RouterHelper.categoriesDetail,
          arguments: categoryId);

  static Future<dynamic> navigateToFavorite(BuildContext context) =>
      Navigator.pushNamed(context, RouterHelper.favorite);

  static navigateToEditProfile(
    BuildContext context,
  ) =>
      Navigator.pushNamed(context, RouterHelper.editProfile);

  static navigateToProductDetails(BuildContext context, ProductModel product) =>
      Navigator.pushNamed(
        context,
        RouterHelper.productDetails,
        arguments: product
      );
}
