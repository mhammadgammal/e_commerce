import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/router/app_router.dart';
import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/core/utils/localization/app_localization.dart';
import 'package:e_commerce/core/utils/localization/localize_constants.dart';
import 'package:e_commerce/features/profile/domain/usecase/get_profile_local_usecase.dart';
import 'package:e_commerce/features/profile/domain/usecase/logout_usecase.dart';
import 'package:e_commerce/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    String? token = sl<CacheHelper>().getString(key: CacheKeys.token);
    bool? isBoarding = sl<CacheHelper>().getBool(key: CacheKeys.isBoarding);
    print(token);
    return BlocProvider(
      create: (context) => ProfileCubit(
          GetProfileLocalUsecase(sl.get()), LogoutUsecase(sl.get()))
        ..getUserData()
        ..prepareProfileGroup(),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: isBoarding == null
              ? RouterHelper.onBoarding
              : token != null
                  ? RouterHelper.root
                  : RouterHelper.login,
          routes: AppRouter.generateRoute,
          locale: sl<AppLanguage>().appLocal,
          supportedLocales: LocalizeConstants.supportedLocales,
          localizationsDelegates: LocalizeConstants.delegates,
          // `builder` runs inside MaterialApp's own Theme, so the safe-area
          // background can be pulled straight from the active theme instead
          // of hardcoding a color widget per screen.
          builder: (context, child) => Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: SafeArea(
                top: false,
                bottom: true,
                child: child!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
