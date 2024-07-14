import 'package:e_commerce/core/di/di.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DbHelper {
  static final HiveInterface hive = sl<HiveInterface>();

  static Future<Box> _openBox(String boxName) async =>
      await hive.openBox(boxName);

  static Future<Box> _getOpenedBox(String boxName) async =>
      await hive.openBox(boxName);

  static Future<Box> getBox(String boxName) async =>
      hive.isBoxOpen(boxName) ? _getOpenedBox(boxName) : _openBox(boxName);
    

  

}
