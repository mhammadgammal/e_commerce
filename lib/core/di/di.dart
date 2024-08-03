import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';
import 'package:e_commerce/features/authentication/data/network/authentication_api_service.dart';
import 'package:e_commerce/features/authentication/data/repositories/authentcation_repository_impl.dart';
import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/features/cart/data/network/cart_api_service.dart';
import 'package:e_commerce/features/cart/data/repository/cart_repository_impl.dart';
import 'package:e_commerce/features/categories/data/network/categories_api_service.dart';
import 'package:e_commerce/features/favorite/data/network/favorite_api_service.dart';
import 'package:e_commerce/features/favorite/data/repository/favorite_repository_impl.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/profile/data/data_source/local/profile_db_service.dart';
import 'package:e_commerce/features/profile/data/repository/profile_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/cart/domain/usecase/toggle_cart_item_usecase.dart';
import '../../features/categories/data/repositories/category_repository_impl.dart';
import '../../features/favorite/domain/usecase/change_favorite_usecase.dart';
import '../../features/home/data/network/products_api_service.dart';
import '../../features/home/data/repositories/products_repository_impl.dart';
import '../../features/home/domain/usecase/get_ad_usecase.dart';
import '../../features/home/domain/usecase/get_banners_usecase.dart';
import '../../features/home/domain/usecase/get_products_usecase.dart';
import '../../features/profile/data/data_source/remote/profle_api_service.dart';
import '../utils/localization/app_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  print('Service Locator is running');
  // #region Localization
  sl.registerLazySingleton<AppLanguage>(() => AppLanguage());

  // #endregion

  // #region SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(
        sl.get(),
      ));
  // #endregion

  // #region database

  // Register Hive as a lazy singleton
  sl.registerLazySingleton<HiveInterface>(() => Hive);
  await sl<HiveInterface>().initFlutter();
  sl<HiveInterface>().registerAdapter(UserModelAdapter());
  print(
      'User adpter registered: ${sl<HiveInterface>().isAdapterRegistered(0)}');
  // #endregion

  // #region Dio
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioHelper>(() => DioHelper(
        sl<Dio>(),
        sl<CacheHelper>(),
      ));
  // #endregion

  // #region Authentication
  sl.registerLazySingleton<AuthentcationRepositoryImpl>(
      () => AuthentcationRepositoryImpl(sl.get()));
  sl.registerLazySingleton<AuthenticationApiServiceImpl>(
      () => AuthenticationApiServiceImpl());
  // #endregion

  // #region Home Products

  sl.registerLazySingleton<ChangeFavoriteUsecase>(
      () => ChangeFavoriteUsecase(sl.get()));
  sl.registerLazySingleton<GetProductsUsecase>(
      () => GetProductsUsecase(sl.get()));
  sl.registerLazySingleton<ToggleCartItemUsecase>(
      () => ToggleCartItemUsecase(sl.get()));
  sl.registerLazySingleton<GetBannersUsecase>(
      () => GetBannersUsecase(sl.get()));
  sl.registerLazySingleton<GetAdUsecase>(() => GetAdUsecase(sl.get()));

  sl.registerLazySingleton<ProductsApiServiceImpl>(
      () => ProductsApiServiceImpl());
  sl.registerLazySingleton<ProductsRepositoryImpl>(
      () => ProductsRepositoryImpl(sl.get()));

  // #endregion

  // #region Category
  sl.registerLazySingleton<CategoriesApiServiceImpl>(
      () => CategoriesApiServiceImpl());

  sl.registerLazySingleton<CategoryRepositoryImpl>(
      () => CategoryRepositoryImpl(sl.get()));
  // #endregion

  // #region favorites
  sl.registerLazySingleton<FavoriteApiService>(() => FavoriteApiService());
  sl.registerLazySingleton<FavoriteRepositoryImpl>(
      () => FavoriteRepositoryImpl(sl.get()));
  // #endregion

  // #region cart
  sl.registerLazySingleton<CartApiServiceImpl>(() => CartApiServiceImpl());
  sl.registerLazySingleton<CartRepositoryImpl>(
      () => CartRepositoryImpl(sl.get()));
  // #endregion

  // #region profile
  sl.registerLazySingleton<ProfileDbService>(() => ProfileDbService());
  sl.registerLazySingleton<ProfleApiService>(() => ProfleApiService());
  sl.registerLazySingleton<ProfileRepositoryImpl>(
      () => ProfileRepositoryImpl(sl.get(), sl.get()));
  // #endregion

  // #region cubits
  sl.registerLazySingleton<HomeCubit>(
      () => HomeCubit(sl.get(), sl.get(), sl.get(), sl.get(), sl.get()));
  // #endregion
}
