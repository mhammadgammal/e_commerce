import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/core/base_use_case/base_auth_usecase.dart';

import '../../data/repositories/authentcation_repository_impl.dart';
import '../../../../core/data/user_model.dart';

class LoginUsecase implements BaseAuthUseCase {
  final AuthentcationRepositoryImpl _authenticationRepo;

  LoginUsecase(this._authenticationRepo);
  @override
  Future<UserModel?> perform(RegisterParams params) =>
      _authenticationRepo.login(params);
}
