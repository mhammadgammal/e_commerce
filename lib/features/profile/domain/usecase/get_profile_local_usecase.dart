import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/features/profile/data/repository/profile_repository_impl.dart';

class GetProfileLocalUsecase implements BaseUsecase<UserModel> {
  final ProfileRepositoryImpl _profileRepository;
  GetProfileLocalUsecase(this._profileRepository);
  @override
  Future<UserModel> perform(params) async {
    return await _profileRepository.getLocalUser();
  }
}
