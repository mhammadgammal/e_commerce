import 'package:e_commerce/bloc_observer.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/localization/app_localization.dart';
import 'package:e_commerce/e_commerce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtil;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await ScreenUtil.ensureScreenSize();

  Bloc.observer = EcommerceBlocObserver();
  await init();
  await sl<AppLanguage>().fetchLocale();
  runApp(const ECommerceApp());
}
