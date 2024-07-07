import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/features/categories/domain/usecase/get_categories_usecase.dart';
import 'package:e_commerce/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:e_commerce/features/categories/presentation/screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/domain/usecase/get_ad_usecase.dart';
import '../../features/home/domain/usecase/get_banners_usecase.dart';
import '../../features/home/domain/usecase/get_products_usecase.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../di/di.dart';

class ScreenView extends StatefulWidget {
  const ScreenView(this.routeName, {super.key});

  final String routeName;

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  @override
  Widget build(BuildContext context) {
    print(widget.routeName);
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (widget.routeName) {
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
                return BlocProvider(
                  create: (_) =>
                      CategoriesCubit(GetCategoriesUsecase(sl.get()))..getCategories(),
                  child: const CategoryScreen(),
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
