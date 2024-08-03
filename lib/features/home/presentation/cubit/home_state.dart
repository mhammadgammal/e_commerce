part of 'home_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitLoaded extends HomeCubitState {}

final class IndexChangedState extends HomeCubitState {}

final class FavLocallyToggledState extends HomeCubitState {}

final class FavRemotlyToggledState extends HomeCubitState {}

final class AdLoadedSuccessfullyState extends HomeCubitState {}

final class FavoriteProductRemovedLocally extends HomeCubitState {}
final class FavoriteProductAddedLocally extends HomeCubitState {}

final class BannersLoadedSuccessfullyState extends HomeCubitState {}

final class FavRemotlyToggledFailedState extends HomeCubitState {
  final String message;

  FavRemotlyToggledFailedState(this.message);
}

final class RecommendedProductsLoadedSuccessfullyState extends HomeCubitState {}

final class CartItemToggleLocallyState extends HomeCubitState {}

final class CartItemToggledRemotelySuccessState extends HomeCubitState {}

final class CartItemToggledRemotelyFailureState extends HomeCubitState {
  final String errorMessage;

  CartItemToggledRemotelyFailureState(this.errorMessage);
}
