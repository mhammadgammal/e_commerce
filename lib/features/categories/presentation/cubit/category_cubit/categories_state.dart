part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoadedSuccessfullyState extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}

final class CategoriesErrorState extends CategoriesState {}
