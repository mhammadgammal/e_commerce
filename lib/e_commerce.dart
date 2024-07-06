import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/router/app_router.dart';
import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/core/utils/localization/app_localization.dart';
import 'package:e_commerce/core/utils/localization/localize_constants.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  static final AppLanguage appLanguage = sl<AppLanguage>();

  @override
  Widget build(BuildContext context) {
    String? token = sl<CacheHelper>().getString(key: CacheKeys.token);
    print(token);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: token != null ? RouterHelper.root : RouterHelper.onBoarding,
      routes: AppRouter.generateRoute,
      locale: appLanguage.appLocal,
      supportedLocales: LocalizeConstants.supportedLocales,
      localizationsDelegates: LocalizeConstants.delegates,
    );
  }
}
