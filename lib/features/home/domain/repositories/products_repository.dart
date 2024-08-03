import '../entity/product_entity/product_model.dart';
import '../entity/product_entity/products_response.dart';

abstract interface class ProductsRepository {
  Future<ProductsResponse> fetchProducts();
  Future<(bool, String?, ProductModel?)> changeFavourite(int id);
}
