import 'package:e_commerce/core/app/app_layout.dart';
import 'package:e_commerce/core/app/cubit/app_cubit.dart';
import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/features/authentication/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/authentication/presentation/screens/register_screen.dart';
import 'package:e_commerce/features/authentication/presentation/view_model/login_cubit/login_cubit_cubit.dart';
import 'package:e_commerce/features/authentication/presentation/view_model/register_cubit/register_cubit_bloc.dart';
import 'package:e_commerce/features/boarding/boarding_screen.dart';
import 'package:e_commerce/features/categories/domain/usecase/get_category_products.dart';
import 'package:e_commerce/features/categories/presentation/cubit/category_product_cubit/category_product_cubit.dart';
import 'package:e_commerce/features/favorite/domain/usecase/change_favorite_usecase.dart';
import 'package:e_commerce/features/favorite/domain/usecase/get_favorite_products.dart';
import 'package:e_commerce/features/favorite/presentation/cubit/favorite_products_cubit.dart';
import 'package:e_commerce/features/favorite/presentation/screen/favorite_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/authentication/domain/usecase/login_usecase.dart';
import '../../features/authentication/domain/usecase/register_usecase.dart';
import '../../features/categories/presentation/screen/category_details.dart';
import '../di/di.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> generateRoute = {
    RouterHelper.root: (_) => BlocProvider(
          create: (context) => AppCubit(),
          child: const AppLayout(),
        ),
    RouterHelper.onBoarding: (_) => OnBoardingScreen(),
    RouterHelper.register: (_) => BlocProvider(
          create: (context) => RegisterCubit(
            RegisterUsecase(sl.get()),
          ),
          child: const RegisterScreen(),
        ),
    RouterHelper.login: (_) => BlocProvider(
          create: (_) => LoginCubitCubit(
            LoginUsecase(sl.get()),
          ),
          child: const LoginScreen(),
        ),
    RouterHelper.categoriesDetail: (context) {
      final categoryId = ModalRoute.of(context)!.settings.arguments as int;
      return BlocProvider(
        create: (context) =>
            CategoryProductCubit(GetCategoryProductsUsecase(sl.get()))
              ..getCategoryProducts(categoryId),
        child: const CategoryDetailsScreen(),
      );
    },
    RouterHelper.favorite: (_) => BlocProvider(
          create: (context) => FavoriteProductsCubit(
              GetFavoriteProductsUseCase(sl.get()),
              ChangeFavoriteUsecase(sl.get()))
            ..getFavoriteProducts(),
          child: const FavoriteProductsScreen(),
        )
  };
}
