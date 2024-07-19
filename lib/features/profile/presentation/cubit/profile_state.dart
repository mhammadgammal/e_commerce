part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class UserLoadedSuccessState extends ProfileState {}

final class LogoutSucessState extends ProfileState {}

final class LogoutFailureState extends ProfileState {}

final class ModificationState extends ProfileState {}

final class ProfileGroupLoadedSuccessState extends ProfileState {}

final class ProfileEditTextFieldsPreparedState extends ProfileState {}
