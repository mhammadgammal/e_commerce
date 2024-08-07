part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class TogglingExpanded extends CartState {}

final class CartItemsLoadingState extends CartState {}

final class CartItemsLoadFailureState extends CartState {}

final class CartItemsLoadSuccessState extends CartState {}

final class SelectQuantityFromExpandedState extends CartState {}

final class CartItemMovingToWislist extends CartState {}

final class CartItemMovedToWislistSuccessState extends CartState {}

final class CartItemMovedToWislistFailureState extends CartState {
  final String e;

  CartItemMovedToWislistFailureState({required this.e});
}

final class CartItemRemovedSuccessState extends CartState {
  final int productId;
  CartItemRemovedSuccessState(this.productId);
}

final class CartItemRemovedFailureState extends CartState {
  final String errorMessage;
  CartItemRemovedFailureState(this.errorMessage);
}
