import 'package:e_commerce/features/cart/domain/entity/cart_response.dart';

abstract interface class CartRepository {
  Future<CartResponse> getCartItems();

  Future toggleCartItem(int productId);
}
