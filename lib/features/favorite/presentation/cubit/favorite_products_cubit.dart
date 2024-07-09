import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/favorite/domain/usecase/get_favorite_products.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:meta/meta.dart';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  final GetFavoriteProductsUseCase _favoriteUsecase;

  FavoriteProductsCubit(this._favoriteUsecase)
      : super(FavoriteProductsInitial());

  List<ProductModel> favoriteProducts = [];

  Future<void> getFavoriteProducts() async {
    emit(FavoriteProductsLoadingState());
    var favorites = await _favoriteUsecase.perform(null);
    for (var fav in favorites) {
      favoriteProducts.add(fav.product);
    }

    emit(FavoriteProductsLoadedSuccessState());
  }
}
