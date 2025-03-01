import 'package:chairy_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData buildLightTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: ColorManager.primary,
      onPrimary: ColorManager.white,
      secondary: ColorManager.white,
      onSecondary: ColorManager.white,
      error: ColorManager.redAccent,
      onError: ColorManager.white,
      background: ColorManager.white,
      onBackground: ColorManager.white,
      surface: ColorManager.white,
      onSurface:ColorManager.white,
    ),
    textTheme: _createTextTheme(brightness),
  );

  return baseTheme;
}
ThemeData buildDarkTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: ColorManager.black,
      onPrimary: ColorManager.white,
      secondary: ColorManager.black,
      onSecondary: ColorManager.white,
      error: ColorManager.redAccent,
      onError: ColorManager.white,
      background: ColorManager.black,
      onBackground: ColorManager.black,
      surface: ColorManager.black,
      onSurface: ColorManager.black,
    ),
    textTheme: _createTextTheme(brightness),
  );

  return baseTheme;
}


TextTheme _createTextTheme(Brightness brightness) {
  return TextTheme(
    titleLarge: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      color: brightness == Brightness.light
          ? ColorManager.white
          : ColorManager.backgroundDark,
      fontFamily: 'AGENCY',
    ),
    // titleMedium: TextStyle(
    //   fontSize: 20.sp,
    //   fontWeight: FontWeight.w600,
    //   color: brightness == Brightness.light
    //       ? EVColors.onBackground87Light
    //       : EVColors.onBackground87Dark,
    //   fontFamily: 'Proza Libre',
    // ),
    // titleSmall: TextStyle(
    //   fontSize: 16.sp,
    //   fontWeight: FontWeight.w600,
    //   color: brightness == Brightness.light
    //       ? EVColors.onBackground87Light
    //       : EVColors.onBackground87Dark,
    //   fontFamily: 'Proza Libre',
    // ),
    // bodyLarge: TextStyle(
    //   fontSize: 16.sp,
    //   fontWeight: FontWeight.w500,
    //   color: brightness == Brightness.light
    //       ? EVColors.onBackground60Light
    //       : EVColors.onBackground60Dark,
    //   fontFamily: 'Proza Libre',
    // ),
    // bodyMedium: TextStyle(
    //   fontSize: 14.sp,
    //   fontWeight: FontWeight.w500,
    //   color: brightness == Brightness.light
    //       ? EVColors.onBackground60Light
    //       : EVColors.onBackground60Dark,
    //   fontFamily: 'Proza Libre',
    // ),
    // bodySmall: TextStyle(
    //   fontSize: 12.sp,
    //   fontWeight: FontWeight.w500,
    //   color: brightness == Brightness.light
    //       ? EVColors.onBackground60Light
    //       : EVColors.onBackground60Dark,
    //   fontFamily: 'Proza Libre',
    // ),
    // labelMedium: TextStyle(
    //   fontSize: 10.sp,
    //   fontWeight: FontWeight.normal,
    //   color: brightness == Brightness.light
    //       ? EVColors.onBackground60Light
    //       : EVColors.onBackground60Dark,
    //   fontFamily: 'Proza Libre',
    // ),
  );
}
