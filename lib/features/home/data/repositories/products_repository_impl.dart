import 'package:e_commerce/features/home/data/network/products_api_service.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/products_response.dart';

import '../../domain/entity/product_entity/product_model.dart';
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

  @override
  Future<(bool, String?, ProductModel?)> changeFavourite(int id) async {
    try {
      var response = await _productsApiService.changeFavoriteStatus(id);
      return (
        response.data['status'] as bool,
        response.data['message'] as String?,
        ProductModel.fromJson(response.data['data']['product']),
      );
    } catch (e) {
      return (false, e.toString(), null);
    }
  }
}
