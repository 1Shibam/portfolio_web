import 'package:flutter/material.dart';
import 'package:portfolio_web/themes/colors.dart';
import 'package:portfolio_web/themes/text_styles.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Freeman',
    scaffoldBackgroundColor: LightThemeColors.background,
    primaryColor: LightThemeColors.primary,
    textTheme: TextTheme(
      headlineLarge:
          AppTextStyles.headlineLarge.copyWith(color: LightThemeColors.text),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: LightThemeColors.text),
      labelLarge: AppTextStyles.button.copyWith(color: LightThemeColors.text),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightThemeColors.primary,
        textStyle: AppTextStyles.button,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightThemeColors.primary,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.button,
      ),
    ),
    colorScheme: const ColorScheme.light(
        surface: LightThemeColors.background,
        primary: LightThemeColors.primary,
        secondary: LightThemeColors.secondary,
        tertiary: LightThemeColors.text),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Freeman',
    scaffoldBackgroundColor: DarkThemeColors.background,
    primaryColor: DarkThemeColors.primary,
    textTheme: TextTheme(
      headlineLarge:
          AppTextStyles.headlineLarge.copyWith(color: DarkThemeColors.text),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: DarkThemeColors.text),
      labelLarge: AppTextStyles.button.copyWith(color: DarkThemeColors.text),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: DarkThemeColors.primary,
        textStyle: AppTextStyles.button,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkThemeColors.primary,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.button,
      ),
    ),
    colorScheme: const ColorScheme.dark(
        surface: DarkThemeColors.background,
        primary: DarkThemeColors.primary,
        secondary: DarkThemeColors.secondary,
        tertiary: DarkThemeColors.text),
  );
}
