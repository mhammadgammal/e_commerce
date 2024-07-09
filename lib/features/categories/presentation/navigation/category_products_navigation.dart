import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/features/categories/presentation/screen/category_details.dart';
import 'package:e_commerce/features/categories/presentation/screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../domain/usecase/get_categories_usecase.dart';
import '../../domain/usecase/get_category_products.dart';
import '../cubit/category_cubit/categories_cubit.dart';
import '../cubit/category_product_cubit/category_product_cubit.dart';

class CategoryProductsNavigation extends StatefulWidget {
  const CategoryProductsNavigation({super.key});

  @override
  State<CategoryProductsNavigation> createState() =>
      _CategoryProductsNavigationState();
}

GlobalKey<NavigatorState> categoryProductNavigatorKey =
    GlobalKey<NavigatorState>();

class _CategoryProductsNavigationState
    extends State<CategoryProductsNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: categoryProductNavigatorKey,
      onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) {
            if (settings.name == RouterHelper.categoriesDetail) {
              var categoryId = settings.arguments as int;
              return BlocProvider(
                  create: (context) =>
                      CategoryProductCubit(GetCategoryProductsUsecase(sl.get()))
                        ..getCategoryProducts(categoryId),
                  child: const CategoryDetailsScreen());
            } else {
              return BlocProvider(
                create: (_) => CategoriesCubit(
                  GetCategoriesUsecase(sl.get()),
                )..getCategories(),
                child: const CategoryScreen(),
              );
            }
          }),
    );
  }
}
