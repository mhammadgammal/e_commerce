import 'package:flutter/material.dart';

abstract final class AppColors {
  // static const primaryColor = Color.fromARGB(255, 16, 26, 80);
  static const primaryColor = Color.fromRGBO(57, 143, 241, 1.0);
  static const Color fabColor = complementaryColor2; // Yellow
  static const Color cardColor = complementaryColor5;
  static const Color golden = Color(0xFFF1B819);

  // Darker shades
  static const Color darkShade1 = Color.fromARGB(255, 29, 39, 97);
  static const Color darkShade2 = Color.fromARGB(255, 36, 51, 123);
  static const Color darkShade3 = Color.fromARGB(255, 11, 22, 59);
  static const Color darkShade4 = Color.fromARGB(255, 0, 0, 0);
  static const Color darkShade5 =
      Color.fromARGB(255, 0, 0, 0); // Adjust as needed
  static const Color darkShade6 = Color(0xff3A4364);
  static const Color darkShade7 = Color(0xff313748);
  static const Color darkShade8 = Color(0xff282E3C);
  static const Color darkShade9 = Color(0xff171C28);

  // Lighter shades
  static const Color lightShade1 = Color.fromARGB(255, 111, 129, 255);
  static const Color lightShade2 = Color.fromARGB(255, 136, 153, 255);
  static const Color lightShade3 = Color.fromARGB(255, 161, 177, 255);
  static const Color lightShade4 = Color.fromARGB(255, 186, 202, 255);
  static const Color lightShade5 = Color.fromARGB(255, 7, 34, 82);

  static const Color complementaryColor1 =
      Color.fromARGB(255, 251, 86, 86); // Red
  static const Color complementaryColor2 =
      Color.fromARGB(255, 251, 178, 86); // Orange
  static const Color complementaryColor3 =
      Color.fromARGB(255, 86, 251, 168); // Green
  static const Color complementaryColor4 =
      Color.fromARGB(255, 86, 214, 251); // Blue
  static const Color complementaryColor5 = Color(0xffEBB97A);
  static const Color complementaryColor6 = Color(0xffFFE1BD);
  static const Color complementaryColor7 = Color(0xffecddaf);

  static const lightGrey = Color(0xFFD3D3D3);
  static const diasabledBtnColor = Color(0xFFCED1DA);
}
