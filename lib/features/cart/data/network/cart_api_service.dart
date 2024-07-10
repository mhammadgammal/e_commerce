import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/api_utils/dio_helper.dart';

abstract interface class CartApiServiceInterface {
  Future<Response> fetchCartItems();

  Future<Response> toggleCartItem(int productItem);
}

class CartApiServiceImpl implements CartApiServiceInterface {
  @override
  Future<Response> fetchCartItems() =>
      sl<DioHelper>().get(url: ApiEndPoints.cart);

  @override
  Future<Response> toggleCartItem(int productItem) {
    throw UnimplementedError();
  }
}
