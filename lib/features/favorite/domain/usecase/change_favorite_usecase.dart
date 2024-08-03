import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/features/home/data/repositories/products_repository_impl.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';

class ChangeFavoriteUsecase implements BaseUsecase<(bool, String?, ProductModel?)> {
  final ProductsRepositoryImpl _productsRepositoryImpl;
  ChangeFavoriteUsecase(this._productsRepositoryImpl);

  @override
  Future<(bool, String?, ProductModel?)> perform(productId) async =>
      await _productsRepositoryImpl.changeFavourite(productId);
}
