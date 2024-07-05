import 'package:e_commerce/features/authentication/data/repositories/authentcation_repository_impl.dart';
import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';
import 'package:e_commerce/features/authentication/domain/usecase/base_usecase.dart';

class RegisterUsecase implements BaseUseCase {
  final AuthentcationRepositoryImpl _authentcationRepositoryImpl;

  RegisterUsecase(this._authentcationRepositoryImpl);
  @override
  Future<UserModel?> perform(RegisterParams params) =>
      _authentcationRepositoryImpl.register(params);
}
