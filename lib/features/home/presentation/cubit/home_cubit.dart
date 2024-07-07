import 'package:e_commerce/features/categories/domain/entity/category_entity/category_model.dart';
import 'package:e_commerce/features/home/domain/usecase/change_favorite_usecase.dart';
import 'package:e_commerce/features/home/domain/usecase/get_ad_usecase.dart';
import 'package:e_commerce/features/home/domain/usecase/get_banners_usecase.dart';
import 'package:e_commerce/features/home/domain/usecase/get_products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/banner_entity/banner_model.dart';
import '../../domain/entity/product_entity/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  final ChangeFavoriteUsecase _changeFavoriteUsecase;
  final GetProductsUsecase _getProductsUsecase;
  final GetBannersUsecase _bannersUsecase;
  final GetAdUsecase _getAdUsecase;
  HomeCubit(
    this._changeFavoriteUsecase,
    this._getProductsUsecase,
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
    String? messsage;
    try {
      (isFavToggled, messsage) =
          await _changeFavoriteUsecase.perform(int.parse(products[index].id));
      print(isFavToggled);
      print(messsage);
      if (isFavToggled) {
        emit(FavRemotlyToggledState());
      } else {
        products[index].isFavourite = !products[index].isFavourite;
        emit(FavRemotlyToggledFailedState(messsage!));
      }
    } catch (e) {
      print(e);
      print(isFavToggled);
      products[index].isFavourite = !isFav;
      emit(FavRemotlyToggledFailedState(messsage!));  
    }
  }
}
