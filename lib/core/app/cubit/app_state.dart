part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class ExitApp extends AppState {}
final class AppInitial extends AppState {}
final class DummyState extends AppState {}
final class AppChangeBottomNavState extends AppState {}
