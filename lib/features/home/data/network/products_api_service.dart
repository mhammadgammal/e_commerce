import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';

import '../../../../core/di/di.dart';

abstract interface class ProductsApiServiceInterface {
  Future<Response> getProducts();
}

class ProductsApiServiceImpl implements ProductsApiServiceInterface {
  @override
  Future<Response> getProducts() async =>
      sl<DioHelper>().get(url: ApiEndPoints.products);
}
