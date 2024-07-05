import 'package:dio/dio.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';
import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';

import '../../domain/entity/register_params.dart';

abstract interface class AuthenticationApiServiceInterface {
  Future<Response> register(RegisterParams params);
  Future<Response> login(UserModel user);
  Future<Response> logout();
  Future<Response> getUser();
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
  Future<Response> login(UserModel user) =>
      sl<DioHelper>().post(url: ApiEndPoints.login, data: user.toJson());

  @override
  Future<Response> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Response> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
