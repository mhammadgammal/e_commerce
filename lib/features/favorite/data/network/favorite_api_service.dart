import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';

import '../../../../core/di/di.dart';

abstract interface class FavoriteApiServiceInterface {
  Future<Response> fetchFavorite();
}

class FavoriteApiService implements FavoriteApiServiceInterface {
  @override
  Future<Response> fetchFavorite() async =>
      sl<DioHelper>().get(url: ApiEndPoints.favorite);
}
