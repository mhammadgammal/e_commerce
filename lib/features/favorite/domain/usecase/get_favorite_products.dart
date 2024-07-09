import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/features/favorite/data/repository/favorite_repository_impl.dart';
import 'package:e_commerce/features/favorite/domain/entity/favorite_response.dart';

class GetFavoriteProductsUseCase implements BaseUsecase<List<FavoriteProductModel>> {
  final FavoriteRepositoryImpl _favoriteRepositoryImpl;

  GetFavoriteProductsUseCase(this._favoriteRepositoryImpl);

  @override
  Future<List<FavoriteProductModel>> perform(params) async {
    var favoriteProductsResponse = await _favoriteRepositoryImpl.getFavorite();

    return favoriteProductsResponse.products;
  }
}
