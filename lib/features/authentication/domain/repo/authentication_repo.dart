import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';

abstract interface class AuthenticationRepository {
  Future<UserModel?> register(RegisterParams params);

  Future<UserModel?> login(UserModel user);

  Future<void> logout();
}
