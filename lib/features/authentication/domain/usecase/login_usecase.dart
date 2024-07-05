import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/core/base_use_case/base_usecase.dart';

import '../../data/repositories/authentcation_repository_impl.dart';
import '../entity/user_model.dart';

class LoginUsecase implements BaseUseCase {
  final AuthentcationRepositoryImpl _authenticationRepo;

  LoginUsecase(this._authenticationRepo);
  @override
  Future<UserModel?> perform(RegisterParams params) =>
      _authenticationRepo.login(params);
}
