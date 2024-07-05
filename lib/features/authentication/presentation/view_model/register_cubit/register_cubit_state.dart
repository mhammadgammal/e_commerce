part of 'register_cubit_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterErrorState extends RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterGoogleLoadingState extends RegisterState {}

final class RegisterChangePasswordVisibilityState extends RegisterState {}
