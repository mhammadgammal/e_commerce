import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  LoginCubitCubit() : super(LoginCubitInitial());

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
  login() async{
    emit(LoginLoadingState());
  }

  loginWithGoogle() {}
}
