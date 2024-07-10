part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartItemsLoadingState extends CartState {}

final class CartItemsLoadFailureState extends CartState {}

final class CartItemsLoadSuccessState extends CartState {}
