import 'package:Hotelino/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final baseLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light, //show this is light
      fontFamily: 'sahel' ,  //show light theme font
      colorSchemeSeed: AppColors.primary, //from constants
      appBarTheme: const AppBarTheme( // for app bar
        elevation: 0,
        titleTextStyle: 
          TextStyle(
            fontSize: 16,
            color: AppColors.lightText,
            fontWeight: FontWeight.w500
          )
      ),
      textTheme: const TextTheme(
        //onboarding screen , material3 typogeraphy
        displayLarge: TextStyle(fontSize: 24 , color: AppColors.lightText , fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 17 , color: AppColors.lightText , fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 16 , color: AppColors.lightText , fontWeight: FontWeight.w400),

        //Hotel Detail , material3 typogeraphy
        headlineLarge: TextStyle(fontSize: 24 , color: AppColors.lightText , fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(fontSize: 20 , color: AppColors.lightText , fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 16 , color: AppColors.lightText , fontWeight: FontWeight.w400),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData( // custome button for hotelino 
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.lightBorder,
            width: 1.5
          )
        ),
        enabledBorder: OutlineInputBorder( //user clicked input edit text
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.lightBorder,
            width: 1.5
          )
        ),
        focusedBorder: OutlineInputBorder( //user clicked and focus
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.lightFocusedBorder,
            width: 1.5
          )
        ),
        hintStyle: TextStyle(
          color: AppColors.lightHint,
          fontSize: 14
        ),
        labelStyle:  TextStyle(
          color: AppColors.lightText,
          fontWeight: FontWeight.bold
        ),
      ),
    );
    return baseLight.copyWith( //auto color with color seed in flutter and custom some color
      colorScheme: baseLight.colorScheme.copyWith(
        outline: Colors.grey[500],
        primaryFixed: AppColors.primary,
        surfaceContainerLow: Colors.grey[200]
      )
    );
  }
  // -----------------------------------------------------------------------------------------

    static ThemeData get darkTheme {
    final baseDark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark, //show this is light
      fontFamily: 'sahel' ,  //show light theme font
      colorSchemeSeed: AppColors.primary, //from constants
      appBarTheme: const AppBarTheme( // for app bar
        elevation: 0,
        titleTextStyle: 
          TextStyle(
            fontSize: 16,
            color: AppColors.darkText,
            fontWeight: FontWeight.w500
          )
      ),
      textTheme: const TextTheme(
        //onboarding screen , material3 typogeraphy
        displayLarge: TextStyle(fontSize: 24 , color: AppColors.darkText , fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 17 , color: AppColors.darkText , fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 16 , color: AppColors.darkText , fontWeight: FontWeight.w400),

        //Hotel Detail , material3 typogeraphy
        headlineLarge: TextStyle(fontSize: 24 , color: AppColors.darkText , fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(fontSize: 20 , color: AppColors.darkText , fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 16 , color: AppColors.darkText , fontWeight: FontWeight.w400),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData( // custome button for hotelino 
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInputFill,
        contentPadding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.darkBorder,
            width: 1.5
          )
        ),
        enabledBorder: OutlineInputBorder( //user clicked input edit text
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.darkBorder,
            width: 1.5
          )
        ),
        focusedBorder: OutlineInputBorder( //user clicked and focus
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.darkFocusedBorder,
            width: 1.5
          )
        ),
        hintStyle: TextStyle(
          color: AppColors.darkHint,
          fontSize: 14
        ),
        labelStyle:  TextStyle(
          color: AppColors.darkText,
          fontWeight: FontWeight.bold
        ),
      ),
    );
    return baseDark.copyWith( //auto color with color seed in flutter and custom some color
      colorScheme: baseDark.colorScheme.copyWith(
        outline: Colors.grey[500],
        primaryFixed: AppColors.primary,
      )
    );
  }

}