import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';
import 'package:e_commerce/features/cart/domain/usecase/get_cart_items_usecase.dart';
import 'package:e_commerce/features/cart/domain/usecase/toggle_cart_item_usecase.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartItemsUsecase _cartItemsUsecase;
  final ToggleCartItemUsecase _toggleCartItemUsecase;
  bool isExpanded = false;
  int expandedQuantityItem = -1;
  int selectedQuantityIndex = 0;

  CartCubit(this._cartItemsUsecase, this._toggleCartItemUsecase)
      : super(CartInitial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);
  List<CartProductModel> cartItems = [];

  Future<void> fetchCartItems() async {
    emit(CartItemsLoadingState());
    try {
      cartItems = await _cartItemsUsecase.perform(null);
      emit(CartItemsLoadSuccessState());
    } catch (e) {
      print(e);
      emit(CartItemsLoadFailureState());
    }
  }

  void onQuantityExpanded(int productIndex) {
    isExpanded = !isExpanded;
    expandedQuantityItem = productIndex;
    emit(TogglingExpanded());
  }

  void selectQuantityFromExpanded(int index, int productIndex) {
    selectedQuantityIndex = index;
    cartItems[productIndex].quantity = index + 1;
    emit(SelectQuantityFromExpandedState());
  }

  Future<void> removeCartItem(String id) async {
    try {
      bool isCartItem = true;
      String? message;
      (isCartItem, message) =
          await _toggleCartItemUsecase.perform(int.parse(id));
      print('cart cubit: $isCartItem');
      print('cart cubit: $message');
      cartItems.removeWhere((product) => product.product.id == id);
      emit(CartItemRemovedSuccessState(
        int.parse(id),
      ));
    } catch (e) {
      print(e.toString());
      emit(CartItemRemovedFailureState(
        e.toString(),
      ));
    }
  }
}
