import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/api_utils/api_end_points.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';

abstract interface class ProfleApiServiceInterface {
  Future<Response> getProfile();
  Future<Response> updateProfile(UserModel user);
  Future<Response> logout();
}

class ProfleApiService implements ProfleApiServiceInterface{
  @override
  Future<Response> getProfile() => sl<DioHelper>().get(url: ApiEndPoints.profile);

  @override
  Future<Response> updateProfile(UserModel user) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  logout() => sl<DioHelper>().post(url: ApiEndPoints.logout, data: {});

}
