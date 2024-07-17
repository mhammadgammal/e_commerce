import '../../../../core/data/user_model.dart';

abstract interface class ProfileRepositoryInterface {
  Future<UserModel> getUser();
  Future<UserModel> updateProfileLocal(UserModel user);
  Future<UserModel> updateProfileRemote(UserModel user);
}
