import '../entity/products_response.dart';

abstract interface class ProductsRepository {
  Future<ProductsResponse> fetchProducts();
}
