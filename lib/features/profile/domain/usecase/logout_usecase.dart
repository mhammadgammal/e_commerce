import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/features/profile/data/repository/profile_repository_impl.dart';

class LogoutUsecase implements BaseUsecase<String?>{
  final ProfileRepositoryImpl _profileRepositoryImpl;
  LogoutUsecase(this._profileRepositoryImpl);
  @override
  Future<String?> perform(params) => _profileRepositoryImpl.logout();
  
}