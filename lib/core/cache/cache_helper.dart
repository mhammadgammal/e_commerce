import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _sharedPreferences;

  CacheHelper(this._sharedPreferences) {
    print('Shared Preferences Init');
  }

  Future<CacheHelper> init() async {
    if (_sharedPreferences.getStringList(CacheKeys.countries) == null) {
      _sharedPreferences.setStringList(CacheKeys.countries,
          ['Egypt', 'United States', 'Saudi Arabia', 'UAE']);
    }
    print('Shared Preferences Init Done');
    return this;
  }

  Future<bool>? putStringList(
          {required String key, required List<String> stringList}) =>
      _sharedPreferences.setStringList(key, stringList);

  Future<bool>? putString({required String key, required String value}) async =>
      _sharedPreferences.setString(key, value);

  List<String>? getStringList({required String key}) =>
      _sharedPreferences.getStringList(key);

  String? getString({required String key}) => _sharedPreferences.getString(key);

  List<String>? getCountries() =>
      _sharedPreferences.getStringList(CacheKeys.countries);

  Future<bool>? removeCached({required String key}) =>
      _sharedPreferences.remove(key);
}
