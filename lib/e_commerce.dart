import 'package:e_commerce/core/router/app_router.dart';
import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouterHelper.onBoarding,
      routes: AppRouter.generateRoute,      
    );
  }
}