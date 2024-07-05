part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginLoadingState extends LoginCubitState {}

final class LoginChangePasswordVisibilityState extends LoginCubitState {}
