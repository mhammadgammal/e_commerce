import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/features/profile/data/data_source/local/profile_db_service.dart';
import 'package:e_commerce/features/profile/data/data_source/remote/profle_api_service.dart';
import 'package:e_commerce/features/profile/domain/repository/profile_repository.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/di.dart';

class ProfileRepositoryImpl implements ProfileRepositoryInterface {
  final ProfileDbService _dbService;
  final ProfleApiService _remoteService;

  ProfileRepositoryImpl(this._dbService, this._remoteService);

  @override
  Future<UserModel> getUser() async {
    UserModel? user;
    user = await _dbService.getUser();
    if (user == null) {
      user = await _getRemoteUser();
      _dbService.addUser(user);
    }
    return user;
  }

  Future<UserModel> _getRemoteUser() async {
    var response = await _remoteService.getProfile();
    print('profile response: ${response.data}');
    return UserModel.fromJson(response.data['data']);
  }

  Future<String?> logout() async {
    var response = await _remoteService.logout();
    var message = response.data['message'];
    print(message);
    if (message != null) {
      _dbService.deleteUser();
      sl<CacheHelper>().removeCached(key: CacheKeys.token);
    }
    return message;
  }

  @override
  Future<UserModel> updateProfileLocal(UserModel user) {
    // TODO: implement updateProfileLocal
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateProfileRemote(UserModel user) {
    // TODO: implement updateProfileRemote
    throw UnimplementedError();
  }
}
