import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';

import '../../../../core/di/di.dart';

abstract interface class CategoriesApiService {
  Future<Response> getCategories();
}

class CategoriesApiServiceImpl implements CategoriesApiService {
  @override
  Future<Response> getCategories() =>
      sl<DioHelper>().get(url: ApiEndPoints.categories);
}
