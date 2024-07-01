import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/localization/app_localization.dart';
import 'package:e_commerce/e_commerce.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await sl<AppLanguage>().fetchLocale();
  runApp(const ECommerceApp());
}
