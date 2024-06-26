import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/localization/app_localization.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton<AppLanguage>(() => AppLanguage());
  final sharedPreferences = await CacheHelper.init();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  
}
