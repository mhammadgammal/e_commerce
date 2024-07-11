import 'package:e_commerce/features/cart/data/network/cart_api_service.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_response.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';

import '../../../home/domain/entity/product_entity/product_model.dart';

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
  Future<(bool, String?, CartProductModel?)> toggleCartItem(
      int productId) async {
    try {
      var response = await _apiServiceImpl.toggleCartItem(productId);
      print('toggleCartItem: ${response.data}');
      print('product ${response.data['message']}: ${response.data['data']}');
      return (
        response.data['status'] as bool,
        response.data['message'] as String?,
        CartProductModel.fromJson(response.data['data'])
      );
    } catch (e) {
      print(e.toString());
      return (
        false,
        e.toString(),
        CartProductModel(
            id: -1,
            quantity: 0,
            product: ProductModel(
                id: '-1',
                title: '',
                image: '',
                oldPrice: '',
                price: '',
                discountPercentage: '',
                isCart: false,
                isFavourite: false))
      );
    }
  }
}
