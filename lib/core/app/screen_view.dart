import 'package:e_commerce/core/router/router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/domain/usecase/get_ad_usecase.dart';
import '../../features/home/domain/usecase/get_banners_usecase.dart';
import '../../features/home/domain/usecase/get_products_usecase.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../di/di.dart';

class ScreenView extends StatelessWidget {
  const ScreenView(this.routeName, {super.key});

  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (routeName) {
              case RouterHelper.home:
                return BlocProvider(
                  create: (context) => HomeCubit(
                    GetProductsUsecase(sl.get()),
                    GetBannersUsecase(sl.get()),
                    GetAdUsecase(sl.get()),
                  )..fetch(),
                  child: const HomeScreen(),
                );
              case RouterHelper.categories:
                return const Center(
                  child: Text('Categories'),
                );
              case RouterHelper.profile:
                return const Center(
                  child: Text('Profile'),
                );
              case RouterHelper.cart:
                return const Center(
                  child: Text('Cart'),
                );
              default:
                return const Center(
                  child: Text('No route defined'),
                );
            }
          }),
    );
  }
}

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    onNavigation();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    onNavigation();
  }
}
