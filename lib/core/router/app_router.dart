import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/features/authentication/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/authentication/presentation/screens/register_screen.dart';
import 'package:e_commerce/features/authentication/presentation/view_model/login_cubit/login_cubit_cubit.dart';
import 'package:e_commerce/features/authentication/presentation/view_model/register_cubit/register_cubit_bloc.dart';
import 'package:e_commerce/features/boarding/boarding_screen.dart';
import 'package:e_commerce/features/home/domain/usecase/get_ad_usecase.dart';
import 'package:e_commerce/features/home/domain/usecase/get_banners_usecase.dart';
import 'package:e_commerce/features/home/domain/usecase/get_products_usecase.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/domain/usecase/login_usecase.dart';
import '../../features/authentication/domain/usecase/register_usecase.dart';
import '../di/di.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> generateRoute = {
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
    RouterHelper.homeScreen: (_) => BlocProvider(
          create: (context) => HomeCubit(
            GetProductsUsecase(sl.get()),
            GetBannersUsecase(sl.get()),
            GetAdUsecase(sl.get()),
          )..fetch(),
          child: const HomeScreen(),
        ),
  };
}
