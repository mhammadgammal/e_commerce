import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/features/cart/data/repository/cart_repository_impl.dart';
import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';

class ToggleCartItemUsecase implements BaseUsecase<(bool, String?, CartProductModel?)> {
  final CartRepositoryImpl _cartRepositoryImpl;

  ToggleCartItemUsecase(this._cartRepositoryImpl);

  @override
  Future<(bool, String?, CartProductModel?)> perform(params) =>
      _cartRepositoryImpl.toggleCartItem(params as int);
}
