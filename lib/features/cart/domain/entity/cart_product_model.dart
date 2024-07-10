import '../../../home/domain/entity/product_entity/product_model.dart';

class CartProductModel {
  int id;
  int quantity;
  ProductModel product;

  CartProductModel({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> productResponse) =>
      CartProductModel(
          id: productResponse['id'],
          quantity: productResponse['quantity'],
          product: ProductModel.fromJson(productResponse['product']));
}
