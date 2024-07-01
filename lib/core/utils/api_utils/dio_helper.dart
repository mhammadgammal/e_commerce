import 'package:dio/dio.dart';

abstract class DioHelper {
  static late Dio _dio;

  Future<void> init() async => _dio = Dio()
    ..options.baseUrl = 'https://student.valuxapps.com/api/'
    ..options.headers = {"Content-Type": "application/json", "lang": "en"};

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  }) async{
    return await _dio.get(url, queryParameters: query);
  }

  static Future<Response> post({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async{
    return await _dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> put({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async{
    return await _dio.put(url, queryParameters: query, data: data);
  }

  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async{
    return await _dio.delete(url, queryParameters: query, data: data);
  }
}
