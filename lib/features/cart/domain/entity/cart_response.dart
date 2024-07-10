import 'cart_product_model.dart';

class CartResponse {
  bool status;
  String? message;
  List<CartProductModel> cartProducts;

  CartResponse({
    required this.status,
    required this.message,
    required this.cartProducts,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    List<CartProductModel> cartProductsResp = [];
    for (var product in json['data']['cart_items']) {
      cartProductsResp.add(CartProductModel.fromJson(product));
    }
    return CartResponse(
        status: json['status'],
        message: json['message'],
        cartProducts: cartProductsResp);
  }
}
