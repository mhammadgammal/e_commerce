import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/favorite/domain/usecase/get_favorite_products.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';

import '../../domain/usecase/change_favorite_usecase.dart';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  final GetFavoriteProductsUseCase _favoriteUsecase;
  final ChangeFavoriteUsecase _changeFavoriteUsecase;

  FavoriteProductsCubit(this._favoriteUsecase, this._changeFavoriteUsecase)
      : super(FavoriteProductsInitial());

  int productId = -1;

  static FavoriteProductsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<ProductModel> favoriteProducts = [];

  Future<void> getFavoriteProducts() async {
    emit(FavoriteProductsLoadingState());
    var favorites = await _favoriteUsecase.perform(null);
    for (var fav in favorites) {
      favoriteProducts.add(fav.product);
    }

    emit(FavoriteProductsLoadedSuccessState());
  }

  void _removeFavoriteProduct(BuildContext context, int productId) async {
    bool isFavourite = true;
    String? message;
    try {
      (isFavourite, message) = await _changeFavoriteUsecase.perform(productId);
      print('fav cubit: $isFavourite');
      print('fav cubit: $message');

      favoriteProducts
          .removeWhere((product) => product.id == productId.toString());
      this.productId = productId;
      emit(FavoriteProductRemovedRemotelySuccessState());
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
      emit(FavoriteProductRemovedRemotelyFailureState());
    }
  }

  void showBottomSheet(BuildContext context, int productId) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => Stack(
              alignment: Alignment.topRight,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () => _removeFavoriteProduct(context, productId),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 20.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                )
              ],
            ));
  }
}
