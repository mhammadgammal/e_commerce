part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class TogglingExpanded extends CartState {}

final class CartItemsLoadingState extends CartState {}

final class CartItemsLoadFailureState extends CartState {}

final class CartItemsLoadSuccessState extends CartState {}

final class SelectQuantityFromExpandedState extends CartState {}
final class CartItemRemovedSuccessState extends CartState {
  final int productId;
  CartItemRemovedSuccessState(
      this.productId
      );
}
final class CartItemRemovedFailureState extends CartState {
  final String errorMessage;
  CartItemRemovedFailureState(this.errorMessage);
}

