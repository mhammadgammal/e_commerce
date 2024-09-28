import 'package:dio/dio.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';

import '../../domain/entity/register_params.dart';

abstract interface class AuthenticationApiServiceInterface {
  Future<Response> register(RegisterParams params);
  Future<Response> login(String email, String password);
}

class AuthenticationApiServiceImpl extends AuthenticationApiServiceInterface {
  @override
  Future<Response> register(RegisterParams params) =>
      sl<DioHelper>().post(url: ApiEndPoints.register, data: {
        'name': params.name,
        'email': params.email,
        'password': params.password,
        'phone': params.phoneNumber,
      });

  @override
  Future<Response> login(String email, String password) => sl<DioHelper>().post(
      url: ApiEndPoints.login, data: {"email": email, "password": password});


}
