import 'package:dio/dio.dart';
import 'package:e_commerce/features/authentication/data/network/authentication_api_service.dart';
import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';

import '../../domain/repo/authentication_repo.dart';

class AuthentcationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApiServiceImpl _authenticationApiServiceImpl;

  AuthentcationRepositoryImpl(this._authenticationApiServiceImpl) {
    print('AuthentcationRepositoryImpl');
  }

  @override
  Future<UserModel?> login(UserModel user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> register(RegisterParams params) async {
    try {
      final response = await _authenticationApiServiceImpl.register(params);

      print('register response: $response');
      if (response.data['data'] != null) {
        return UserModel.fromJson(response.data['data']);
      }
    } on DioException catch (e) {
      print('register error: $e');
    }
    return null;
  }
}
