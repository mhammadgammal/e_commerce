import 'package:dio/dio.dart';
import 'package:e_commerce/core/database/db_helper.dart';
import 'package:e_commerce/features/authentication/data/network/authentication_api_service.dart';
import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/core/data/user_model.dart';

import '../../domain/repo/authentication_repo.dart';

class AuthentcationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApiServiceImpl _authenticationApiServiceImpl;

  AuthentcationRepositoryImpl(this._authenticationApiServiceImpl) {
    print('AuthentcationRepositoryImpl');
  }

  @override
  Future<UserModel?> login(RegisterParams params) async {
    try {
      final response = await _authenticationApiServiceImpl.login(
          params.email, params.password);
      print('login response: $response');
      if (response.data['data'] != null) {
        var user = UserModel.fromJson(response.data['data']);
        _saveToDb(user);
        return user;
      }
    } catch (e) {
      print('login error: $e');
    }

    return null;
  }

  Future<void> _saveToDb(UserModel user) async {
    print('save to db');

    DbHelper.getBox('user').then((value) async {
      print('in then');
      int insertionResult = await value.add(user);
      print('insertion Result: $insertionResult');
      return value.add(user);
    });
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
