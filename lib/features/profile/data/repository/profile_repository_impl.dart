import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/features/profile/data/data_source/local/profile_db_service.dart';
import 'package:e_commerce/features/profile/data/data_source/remote/profle_api_service.dart';
import 'package:e_commerce/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepositoryInterface {
  final ProfileDbService _dbService;
  final ProfleApiService _remoteService;

  ProfileRepositoryImpl(this._dbService, this._remoteService);

  @override
  Future<UserModel> getLocalUser() async {
    var user = await _dbService.getUser();
    print('local user: ${user.id}');   
    print('local user: ${user.credit}');   
    return user;
  }

  @override
  Future<UserModel> getRemoteUser() async {
    var response = await _remoteService.getProfile();
    print('profile response: ${response.data}');
    return UserModel.fromJson(response.data['data']);
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
