part of 'favorite_products_cubit.dart';

@immutable
sealed class FavoriteProductsState {}

final class FavoriteProductsInitial extends FavoriteProductsState {}

final class FavoriteProductsLoadingState extends FavoriteProductsState {}

final class FavoriteProductsLoadedSuccessState extends FavoriteProductsState {}
final class FavoriteProductRemovedRemotelySuccessState extends FavoriteProductsState {}
final class FavoriteProductRemovedRemotelyFailureState extends FavoriteProductsState {}
