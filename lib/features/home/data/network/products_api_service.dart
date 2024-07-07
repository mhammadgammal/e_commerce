import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';

import '../../../../core/di/di.dart';

abstract interface class ProductsApiServiceInterface {
  Future<Response> getProducts();
  Future<Response> getCategories();
  Future<Response> changeFavoriteStatus(int productId);
}

class ProductsApiServiceImpl implements ProductsApiServiceInterface {
  @override
  Future<Response> getProducts() async =>
      sl<DioHelper>().get(url: ApiEndPoints.products);
  
  @override
  Future<Response> getCategories() async =>
      sl<DioHelper>().get(url: ApiEndPoints.categories);

  @override
  Future<Response> changeFavoriteStatus(int productId) async =>
      sl<DioHelper>().post(url: ApiEndPoints.favorite, data: {"product_id": productId}); 
}
