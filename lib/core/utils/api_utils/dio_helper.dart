import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  final Dio _dio;
  final SharedPreferences _sharedPreferences;

  DioHelper(this._dio, this._sharedPreferences) {
    _dio
      ..options.baseUrl = ApiEndPoints.baseUrl
      ..options.headers = {
        "Content-Type": "application/json",
        "lang": "en",
        'Authorization': '${_sharedPreferences.getString(CacheKeys.token)}'
      };
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(url, queryParameters: query);
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await _dio.post(url, queryParameters: query, data: data);
  }

  Future<Response> put({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await _dio.put(url, queryParameters: query, data: data);
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await _dio.delete(url, queryParameters: query, data: data);
  }
}
