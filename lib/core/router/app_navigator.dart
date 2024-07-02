import 'package:e_commerce/core/router/router_helper.dart';
import 'package:flutter/material.dart';

abstract class AppNavigator {
  static void navigateToRegister(BuildContext context) =>
      Navigator.pushNamed(context, RouterHelper.register);
}
