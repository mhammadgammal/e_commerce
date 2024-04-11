
import 'package:flutter/material.dart';

import 'app_color.dart';
abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style:
          ButtonStyle(iconColor: MaterialStatePropertyAll<Color>(Colors.white)),
    ),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(AppColors.lightShade2),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.complementaryColor2,
        foregroundColor: Colors.black,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.complementaryColor2,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      backgroundColor: AppColors.primaryColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkShade1,
    ),
    searchViewTheme: const SearchViewThemeData(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      backgroundColor: AppColors.lightShade1,
    ),
    searchBarTheme: const SearchBarThemeData(
        backgroundColor:
            MaterialStatePropertyAll<Color>(AppColors.complementaryColor3)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkShade7, foregroundColor: Colors.white),
    cardTheme: const CardTheme(
      color: AppColors.cardColor,
    ),
    switchTheme: const SwitchThemeData(
      trackColor: MaterialStatePropertyAll<Color>(AppColors.lightShade1),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.white,
      cursorColor: Colors.white,
      selectionColor: AppColors.complementaryColor2,
    ),
  );
}
