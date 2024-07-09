import '../entity/favorite_response.dart';

abstract interface class FavoriteRepository{
  Future<FavoriteResponse> getFavorite();
}