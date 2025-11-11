import 'package:flutter/material.dart';
import 'package:untitled/src/core/theme/styles.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            )),
      ),
      splashColor: Colors.transparent,
      brightness: Brightness.dark,
      hoverColor: Colors.transparent,
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
      )),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: getRegularStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: getRegularStyle(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red))),
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.transparent),
        surfaceTintColor: Colors.white,
        foregroundColor: AppColors.primary,
      ),
    );
  }


  static ThemeData darkTheme() => ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    applyElevationOverlayColor: true,
    dividerTheme: const DividerThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white),
    ),
  );

}
