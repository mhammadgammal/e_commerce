import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/features/home/data/repositories/products_repository_impl.dart';

class ChangeFavoriteUsecase implements BaseUsecase<(bool, String?)> {
  final ProductsRepositoryImpl _productsRepositoryImpl;
  ChangeFavoriteUsecase(this._productsRepositoryImpl);

  @override
  Future<(bool, String?)> perform(productId) async =>
      await _productsRepositoryImpl.changeFavourite(productId);
}
