

import 'package:flutter/material.dart';

class ThemingApp{
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffFF7622),
        onPrimary: Colors.white,
        secondary: Color(0xff181C2E),
        onSecondary: Colors.white,
        error: Color(0xffE74C3C),
        onError: Colors.white,
        surface: Color(0xffF6F6F6),
        onSurface: Color(0xff181C2E),
      ),

  );
  static ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffFF7622),
        onPrimary: Colors.white,
        secondary: Color(0xffFFD27C),
        onSecondary: Color(0xff121223),
        error: Color(0xffCF6679),
        onError: Colors.black,
        surface: Color(0xff1E1E32),
        onSurface: Colors.white,

      )
  );

}