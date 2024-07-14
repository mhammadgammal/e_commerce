import '../../../../core/data/user_model.dart';

abstract interface class ProfileRepositoryInterface {
  Future<UserModel> getLocalUser();
  Future<UserModel> getRemoteUser();
  Future<UserModel> updateProfileLocal(UserModel user);
  Future<UserModel> updateProfileRemote(UserModel user);
}
