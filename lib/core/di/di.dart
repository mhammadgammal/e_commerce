import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/utils/api_utils/dio_helper.dart';
import 'package:e_commerce/features/authentication/data/network/authentication_api_service.dart';
import 'package:e_commerce/features/authentication/data/repositories/authentcation_repository_impl.dart';
import 'package:e_commerce/features/authentication/domain/entity/user_model.dart';
import 'package:get_it/get_it.dart';

import '../utils/localization/app_localization.dart';

final sl = GetIt.instance;

Future<void> init() async {
  print('Service Locatior is running');
  // #region Localization
  sl.registerLazySingleton<AppLanguage>(() => AppLanguage());
  
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<UserModel>(() => UserModel(
        id: '-1',
        name: '',
        email: '',
        phone: '',
        image: '',
        token: '',
        credit: '',
        points: '',
      ));
  // #endregion

  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioHelper>(() => DioHelper(
        sl<Dio>(),
        sl<CacheHelper>(),
      ));

  // #region Authentication
  sl.registerLazySingleton<AuthentcationRepositoryImpl>(
      () => AuthentcationRepositoryImpl(sl.get()));
  sl.registerLazySingleton<AuthenticationApiServiceImpl>(
      () => AuthenticationApiServiceImpl());

  // #endregion
}
