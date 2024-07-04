import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/features/authentication/presentation/screens/register_screen.dart';
import 'package:e_commerce/features/authentication/presentation/view_model/register_cubit/register_cubit_bloc.dart';
import 'package:e_commerce/features/boarding/boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> generateRoute = {
    RouterHelper.onBoarding: (_) => OnBoardingScreen(),
    // RouterHelper.login: (_) => Container(),
    RouterHelper.register: (_) => BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterScreen(),
        ),
  };
}
