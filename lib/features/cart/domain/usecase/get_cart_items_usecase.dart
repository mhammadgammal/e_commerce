import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/features/cart/data/repository/cart_repository_impl.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';

class GetCartItemsUsecase implements BaseUsecase<List<CartProductModel>> {
  final CartRepositoryImpl _cartRepositoryImpl;

  GetCartItemsUsecase(this._cartRepositoryImpl);

  @override
  Future<List<CartProductModel>> perform(params) async {
    var cartProductResponse = await _cartRepositoryImpl.getCartItems();

    return cartProductResponse.cartProducts;
  }
}
