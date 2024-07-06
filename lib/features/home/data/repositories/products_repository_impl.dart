import 'package:e_commerce/features/home/data/network/products_api_service.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/products_response.dart';

import '../../domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiServiceImpl _productsApiService;

  ProductsRepositoryImpl(this._productsApiService);

  @override
  Future<ProductsResponse> fetchProducts() async {
    var productsResponse = await _productsApiService.getProducts();
    print(productsResponse.data);
    return ProductsResponse.fromJson(productsResponse.data);
  }
}
