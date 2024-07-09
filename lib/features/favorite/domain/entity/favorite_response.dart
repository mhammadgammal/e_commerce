import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';

class FavoriteResponse {
  bool status;
  String? message;
  List<FavoriteProductModel> products;

  FavoriteResponse(
      {required this.status, required this.message, required this.products});

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    List<FavoriteProductModel> products = [];
    for (var fav in json['data']['data']) {
      products.add(
        FavoriteProductModel.fromJson(fav),
      );
    }

    return FavoriteResponse(
        status: json['status'], message: json['message'], products: products);
  }
}

class FavoriteProductModel {
  int productId;
  ProductModel product;

  FavoriteProductModel({
    required this.productId,
    required this.product,
  });

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) =>
      FavoriteProductModel(
          productId: json['id'],
          product: ProductModel.fromJson(json['product']));
}
