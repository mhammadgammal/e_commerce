import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  SharedPreferences? _sharedPreferences;

  CacheHelper() {
    print('Shared Preferences Init');
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
      print('Shared Preferences Init Done');
    });
    if (_sharedPreferences?.getStringList(CacheKeys.countries) == null) {
      _sharedPreferences?.setStringList(CacheKeys.countries,
          ['Egypt', 'United States', 'Saudi Arabia', 'UAE']);
    }
  }

  Future<bool>? putStringList(
          {required String key, required List<String> stringList}) =>
      _sharedPreferences?.setStringList(key, stringList);

  Future<bool>? putString({required String key, required String value}) =>
      _sharedPreferences?.setString(key, value);

  List<String>? getStringList({required String key}) =>
      _sharedPreferences?.getStringList(key);

  String? getString({required String key}) =>
      _sharedPreferences?.getString(key);

  List<String>? getCountries() =>
      _sharedPreferences?.getStringList(CacheKeys.countries);

  Future<bool>? removeCached({required String key}) =>
      _sharedPreferences?.remove(key);
}
