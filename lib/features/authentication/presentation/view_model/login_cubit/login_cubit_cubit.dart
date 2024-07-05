import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/features/authentication/domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/di/di.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginUsecase _loginUsecase;

  LoginCubitCubit(
    this._loginUsecase,
  ) : super(LoginCubitInitial());

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  static LoginCubitCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;
  String? validateEmail(String? email) => email == null || email.isEmpty
      ? 'Please enter your email address'
      : !(email.contains('@'))
          ? 'Please enter @ to be valid email address'
          : null;

  String? validatePassword(String? password) =>
      password == null || password.isEmpty
          ? 'Password cannot be empty'
          : password.length < 8
              ? 'Password must be at least 8 characters'
              : null;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    emit(LoginChangePasswordVisibilityState());
  }

  login() async {
    print('login');
    emit(LoginLoadingState());

    var user = await _loginUsecase.perform(RegisterParams(
        email: emailController.text, password: passwordController.text));

    if (user != null) {
      sl<CacheHelper>().putString(key: CacheKeys.token, value: user.token);
      emit(LoginSuccessState());
    } else {
      emit(LoginFailureState());
    }
  }

  loginWithGoogle() {}
}
