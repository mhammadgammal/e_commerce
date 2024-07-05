import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';

abstract interface class BaseUseCase {
  Future<UserModel?> perform(RegisterParams params);
}