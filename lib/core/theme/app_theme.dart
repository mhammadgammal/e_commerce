import 'package:flutter/material.dart';

import 'app_color.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style:
          ButtonStyle(iconColor: WidgetStatePropertyAll<Color>(Colors.white)),
    ),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll<Color>(AppColors.lightShade2),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.complementaryColor2,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0.0,
      elevation: 0.0,
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
            WidgetStatePropertyAll<Color>(AppColors.complementaryColor3)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkShade7, foregroundColor: Colors.white),
    cardTheme: CardTheme(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      color: Colors.white,
    ),
    switchTheme: const SwitchThemeData(
      trackColor: WidgetStatePropertyAll<Color>(AppColors.lightShade1),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.white,
      cursorColor: Colors.white,
      selectionColor: AppColors.complementaryColor2,
    ),
  );
}
