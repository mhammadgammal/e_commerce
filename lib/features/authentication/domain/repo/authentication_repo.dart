import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';

abstract interface class AuthenticationRepository {
  Future<UserModel?> register(UserModel user);

  Future<UserModel?> login(UserModel user);

  Future<void> logout();
}
