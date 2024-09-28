import 'package:e_commerce/core/base_use_case/base_auth_usecase.dart';
import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/features/authentication/data/repositories/authentcation_repository_impl.dart';
import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';

class RegisterUsecase implements BaseAuthUseCase {
  final AuthenticationRepositoryImpl _authentcationRepositoryImpl;

  RegisterUsecase(this._authentcationRepositoryImpl);
  @override
  Future<UserModel?> perform(RegisterParams params) =>
      _authentcationRepositoryImpl.register(params);
}
