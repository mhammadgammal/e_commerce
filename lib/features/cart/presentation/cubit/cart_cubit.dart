import 'package:e_commerce/core/notifiers/notifiers.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';
import 'package:e_commerce/features/cart/domain/usecase/get_cart_items_usecase.dart';
import 'package:e_commerce/features/cart/domain/usecase/toggle_cart_item_usecase.dart';
import 'package:e_commerce/features/favorite/domain/usecase/change_favorite_usecase.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartItemsUsecase _cartItemsUsecase;
  final ToggleCartItemUsecase _toggleCartItemUsecase;
  final ChangeFavoriteUsecase _moveToWishlist;
  bool isExpanded = false;
  int expandedQuantityItem = -1;
  int selectedQuantityIndex = 0;

  CartCubit(
      this._cartItemsUsecase, this._toggleCartItemUsecase, this._moveToWishlist)
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
      _removeItem(id, cartProductItem);
      print('cart cubit: $isCartItem');
      print('cart cubit: $message');

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

  Future<void> moveToWishlistPressed(String id) async {
    emit(CartItemMovingToWislist());
    bool isSuccess = false;
    String? message;
    ProductModel? item;
    CartProductModel? cartProductItem;
    (_, _, cartProductItem) =
        await _toggleCartItemUsecase.perform(int.parse(id));
    if (cartItemsNotifier.value
        .where((item) => item.product.id == id)
        .first
        .product
        .isFavourite) {
      _removeItem(id, cartProductItem);
    } else {
      try {
        (isSuccess, message, item) =
            await _moveToWishlist.perform(int.parse(id));
        if (isSuccess) {
          _removeItem(id, item!);
          emit(CartItemMovedToWislistSuccessState());
        } else {
          emit(CartItemMovedToWislistFailureState(e: message!));
        }
      } catch (e) {
        emit(CartItemMovedToWislistFailureState(e: e.toString()));
      }
    }
  }

  void _removeItem(id, item) {
    cartItemsCounter.value--;
    cartItemsNotifier.value = _removeFromList(id);
    cartItemsId.value = {...cartItemsId.value}
      ..remove(item is CartProductModel ? item.product.id : item.id);
  }

  List<CartProductModel> _removeFromList(id) =>
      List.from(cartItemsNotifier.value)
        ..removeWhere((product) => product.product.id == id);
}
