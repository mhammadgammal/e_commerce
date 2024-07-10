import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';
import 'package:e_commerce/features/cart/domain/usecase/get_cart_items_usecase.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartItemsUsecase _cartItemsUsecase;

  CartCubit(this._cartItemsUsecase) : super(CartInitial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);
  List<CartProductModel> cartItems = [];

  Future<void> fetchCartItems() async {
    emit(CartItemsLoadingState());
    try{
      cartItems = await _cartItemsUsecase.perform(null);
      emit(CartItemsLoadSuccessState());
    }catch (e){
      print(e);
      emit(CartItemsLoadFailureState());
    }
  }
}
