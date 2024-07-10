import 'package:e_commerce/features/cart/data/network/cart_api_service.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_response.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartApiServiceImpl _apiServiceImpl;

  CartRepositoryImpl(this._apiServiceImpl);

  @override
  Future<CartResponse> getCartItems() async {
    var response = await _apiServiceImpl.fetchCartItems();
    print(response.data);
    return CartResponse.fromJson(response.data);
  }

  @override
  Future<(bool, String?)> toggleCartItem(int productId) async {
    try {
      var response = await _apiServiceImpl.toggleCartItem(productId);
      print('toggleCartItem: ${response.data}');
      return (
      response.data['status'] as bool,
      response.data['message'] as String?
      );
    } catch (e) {
      print(e.toString());
      return (
      false,
      e.toString(),
      );
    }
  }
}
