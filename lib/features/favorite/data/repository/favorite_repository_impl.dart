import 'package:e_commerce/features/favorite/data/network/favorite_api_service.dart';
import 'package:e_commerce/features/favorite/domain/entity/favorite_response.dart';

import '../../domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository{
  final FavoriteApiService _apiService;

  FavoriteRepositoryImpl(this._apiService);

  @override
  Future<FavoriteResponse> getFavorite() async{
    var favoriteResponse = await _apiService.fetchFavorite();
    print(favoriteResponse.data);
    return FavoriteResponse.fromJson(favoriteResponse.data);
  }

}