import 'package:e_commerce/core/base_use_case/base_auth_usecase.dart';
import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';

class GetCategoriesUsecase implements BaseAuthUseCase{
  @override
  Future<UserModel?> perform(RegisterParams params) {
    // TODO: implement perform
    throw UnimplementedError();
  }
  
}