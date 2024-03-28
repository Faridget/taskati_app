import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';
 
class AppTheme {
  static ThemeData appLightTheme = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white, foregroundColor: AppColors.primary),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColors.primary,
          // secondary: ,
          background: AppColors.white,
          // text
          onSurface: AppColors.black,
          error: AppColors.red,
          seedColor: AppColors.primary),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.white,
      ),
      timePickerTheme: TimePickerThemeData(backgroundColor: AppColors.white),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallStyle(),
          prefixIconColor: AppColors.primary,
          suffixIconColor: AppColors.primary,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red))));
  static ThemeData appDarkTheme = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: AppColors.black,
      datePickerTheme:
          DatePickerThemeData(backgroundColor: AppColors.black),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.primary),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColors.black,
        dialBackgroundColor: AppColors.black,
        
      ),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColors.primary,
          background: AppColors.black,
          // text
          onSurface: AppColors.white,
          seedColor: AppColors.primary),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallStyle(),
          prefixIconColor: AppColors.primary,
          suffixIconColor: AppColors.primary,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red))));
}