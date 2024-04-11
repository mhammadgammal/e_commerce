import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (_sharedPreferences?.getStringList(CacheKeys.countries) == null) {
      _sharedPreferences?.setStringList(CacheKeys.countries,
          ['Egypt', 'United States', 'Saudi Arabia', 'UAE']);
    }
  }

  static Future<bool>? putStringList(
          {required String key, required List<String> stringList}) =>
      _sharedPreferences?.setStringList(key, stringList);

  static List<String>? getStringList({required String key}) =>
      _sharedPreferences?.getStringList(key);

  static List<String>? getCountries() =>
      _sharedPreferences?.getStringList(CacheKeys.countries);

  static Future<bool>? removeCached({required String key}) =>
      _sharedPreferences?.remove(key);
}
