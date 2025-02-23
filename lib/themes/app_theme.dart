import 'package:flutter/material.dart';
import 'package:portfolio_web/themes/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightThemeColors.background,
    primaryColor: LightThemeColors.primary,
    cardColor: LightThemeColors.card,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightThemeColors.surface,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: LightThemeColors.textPrimary),
      bodyMedium: TextStyle(color: LightThemeColors.textSecondary),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: LightThemeColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkThemeColors.background,
    primaryColor: DarkThemeColors.primary,
    cardColor: DarkThemeColors.card,
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkThemeColors.surface,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: DarkThemeColors.textPrimary),
      bodyMedium: TextStyle(color: DarkThemeColors.textSecondary),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: DarkThemeColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
