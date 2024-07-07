part of 'home_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitLoaded extends HomeCubitState {}

final class IndexChangedState extends HomeCubitState {}

final class AdLoadedSuccessfullyState extends HomeCubitState {}

final class BannersLoadedSuccessfullyState extends HomeCubitState {}


final class RecommendedProductsLoadedSuccessfullyState extends HomeCubitState {}
