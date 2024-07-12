import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';
import 'package:e_commerce/features/cart/domain/usecase/toggle_cart_item_usecase.dart';
import 'package:e_commerce/features/categories/domain/entity/category_entity/category_model.dart';
import 'package:e_commerce/features/favorite/domain/usecase/change_favorite_usecase.dart';
import 'package:e_commerce/features/home/domain/usecase/get_ad_usecase.dart';
import 'package:e_commerce/features/home/domain/usecase/get_banners_usecase.dart';
import 'package:e_commerce/features/home/domain/usecase/get_products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/notifiers/notifiers.dart';
import '../../domain/entity/banner_entity/banner_model.dart';
import '../../domain/entity/product_entity/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  final ChangeFavoriteUsecase _changeFavoriteUsecase;
  final ToggleCartItemUsecase _cartItemUsecase;
  final GetProductsUsecase _getProductsUsecase;
  final GetBannersUsecase _bannersUsecase;
  final GetAdUsecase _getAdUsecase;

  HomeCubit(
    this._changeFavoriteUsecase,
    this._getProductsUsecase,
    this._cartItemUsecase,
    this._bannersUsecase,
    this._getAdUsecase,
  ) : super(HomeCubitInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  final searchController = TextEditingController();
  List<ProductModel> products = [];
  List<BannerModel> banners = [];
  List<CategoryModel> categories = [];
  String ads = '';
  int currentIndex = 0;

  void fetch() async {
    emit(HomeCubitLoading());
    await _fetchRecommended();
    await _fetchBanners();
    await _fetchAd();
    emit(HomeCubitLoaded());
  }

  Future<void> _fetchRecommended() async {
    products = await _getProductsUsecase.perform(null);
    // cartItemsId.value = {  item.id : item.isCart };
    for (var item in products) {
      if (item.isCart) {
        cartItemsId.value = {
          ...cartItemsId.value,
          item.id: true,
        };
      }
    }
    print('HomeCubit: products in cart ==> ${cartItemsId.value}');
    emit(RecommendedProductsLoadedSuccessfullyState());
  }

  Future<void> _fetchBanners() async {
    banners = await _bannersUsecase.perform(null);
    emit(BannersLoadedSuccessfullyState());
  }

  Future<void> _fetchAd() async {
    ads = await _getAdUsecase.perform(null);
    emit(AdLoadedSuccessfullyState());
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(IndexChangedState());
  }

  void onFavPressed(int index, bool isFav) async {
    products[index].isFavourite = !isFav;
    emit(FavLocallyToggledState());
    bool isFavToggled = false;
    String? message;
    try {
      (isFavToggled, message) =
          await _changeFavoriteUsecase.perform(int.parse(products[index].id));
      print(isFavToggled);
      print(message);
      if (isFavToggled) {
        emit(FavRemotlyToggledState());
      } else {
        products[index].isFavourite = !products[index].isFavourite;
        emit(FavRemotlyToggledFailedState(message!));
      }
    } catch (e) {
      print(e);
      print(isFavToggled);
      products[index].isFavourite = !isFav;
      emit(FavRemotlyToggledFailedState(message!));
    }
  }

  void removeFavProductLocally(int productId) {
    var product =
        products.where((product) => product.id == productId.toString()).first;
    product.isFavourite = false;
    emit(FavoriteProductRemovedLocally());
  }

  Future<int> countFavProducts() async {
    int count = 0;
    for (var product in products) {
      if (product.isFavourite) {
        count++;
      }
    }
    return count;
  }

  Future<void> onCartPressed(int index, bool isCartItem) async {
    products[index].isCart = !isCartItem;
    emit(CartItemToggleLocallyState());
    bool isCartItemStatus = false;
    String? message;
    CartProductModel? cartProductItem;
    try {
      (isCartItemStatus, message, cartProductItem) =
          await _cartItemUsecase.perform(int.parse(products[index].id));
      print(isCartItemStatus);
      print(message);
      if (isCartItemStatus) {
        if (message == 'Added Successfully') {
          cartItemsCounter.value++;
          // tempList.add(cartProductItem!);
          cartItemsNotifier.value = List.from(cartItemsNotifier.value)
            ..add(cartProductItem!);
          cartItemsId.value = {
            ...cartItemsId.value,
            cartProductItem.product.id: true
          };
        } else if (message == 'Deleted Successfully') {
          cartItemsCounter.value--;
          cartItemsNotifier.value = List.from(cartItemsNotifier.value)
            ..removeLast();
          cartItemsId.value = {...cartItemsId.value}
            ..remove(cartProductItem?.product.id);
        }
        emit(CartItemToggledRemotelySuccessState());
        print('AppCubit ==> cart items count: ${cartItemsCounter.value}');
      } else {
        products[index].isCart = !products[index].isCart;
        emit(CartItemToggledRemotelyFailureState(message.toString()));
      }
    } catch (e) {
      print('Error toggling cart item: $e');
      emit(CartItemToggledRemotelyFailureState(e.toString()));
    }
  }
}
