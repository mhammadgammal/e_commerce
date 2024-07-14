import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/features/profile/data/repository/profile_repository_impl.dart';

class GetProfileRemoteUsecase implements BaseUsecase<UserModel> {
  final ProfileRepositoryImpl _profileRepositoryImpl;
  GetProfileRemoteUsecase(this._profileRepositoryImpl);
  @override
  Future<UserModel> perform(params) async =>
      await _profileRepositoryImpl.getRemoteUser();
}
