import 'package:dio/dio.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';
import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';

abstract interface class AuthenticationApiServiceInterface {
  Future<Response> register(UserModel user);
  Future<Response> login(UserModel user);
  Future<Response> logout();
  Future<Response> getUser();
}

class AuthenticationApiServiceImpl extends AuthenticationApiServiceInterface {
  @override
  Future<Response> register(UserModel user) =>
      sl<DioHelper>().post(url: ApiEndPoints.register, data: user.toJson());

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
