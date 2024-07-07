import '../entity/product_entity/products_response.dart';

abstract interface class ProductsRepository {
  Future<ProductsResponse> fetchProducts();
  Future<(bool, String?)> changeFavourite(int id);
}
