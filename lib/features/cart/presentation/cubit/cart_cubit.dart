import 'package:e_commerce/core/notifiers/notifiers.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';
import 'package:e_commerce/features/cart/domain/usecase/get_cart_items_usecase.dart';
import 'package:e_commerce/features/cart/domain/usecase/toggle_cart_item_usecase.dart';
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

  static CartCubit get(context) => BlocProvider.of(context);
  // List<CartProductModel> cartItems = [];

  Future<void> fetchCartItems() async {
    emit(CartItemsLoadingState());
    try {
      cartItemsNotifier.value = await _cartItemsUsecase.perform(null);
      emit(CartItemsLoadSuccessState());
      cartItemsCounter.value = cartItemsNotifier.value.length;
      print('CartCubit ==> cart items count: ${cartItemsCounter.value}');
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
    cartItemsNotifier.value[productIndex].quantity = index + 1;
    emit(SelectQuantityFromExpandedState());
  }

  Future<void> removeCartItem(String id) async {
    try {
      bool isCartItem = true;
      String? message;
      CartProductModel? cartProductItem;
      (isCartItem, message, cartProductItem) =
          await _toggleCartItemUsecase.perform(int.parse(id));
      print('cart cubit: $isCartItem');
      print('cart cubit: $message');
      cartItemsNotifier.value.removeWhere((product) => product.product.id == id);
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
