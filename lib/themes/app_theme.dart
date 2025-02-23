import 'package:flutter/material.dart';
import 'package:portfolio_web/themes/colors.dart';
import 'package:portfolio_web/themes/text_styles.dart';

class AppTheme {
  //! Light Theme

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightThemeColors.background,
    primaryColor: LightThemeColors.primary,
    cardColor: LightThemeColors.card,
    appBarTheme: AppBarTheme(
      backgroundColor: LightThemeColors.surface,
      titleTextStyle: AppTextStyles.headlineSmall.copyWith(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge
          .copyWith(color: LightThemeColors.textPrimary),
      headlineMedium: AppTextStyles.headlineMedium
          .copyWith(color: LightThemeColors.textPrimary),
      headlineSmall: AppTextStyles.headlineSmall
          .copyWith(color: LightThemeColors.textSecondary),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: LightThemeColors.textPrimary),
      bodyMedium: AppTextStyles.bodyMedium
          .copyWith(color: LightThemeColors.textSecondary),
      bodySmall: AppTextStyles.bodySmall
          .copyWith(color: LightThemeColors.textSecondary),
      labelLarge: AppTextStyles.button.copyWith(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: LightThemeColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  //! Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkThemeColors.background,
    primaryColor: DarkThemeColors.primary,
    cardColor: DarkThemeColors.card,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkThemeColors.surface,
      titleTextStyle: AppTextStyles.headlineSmall.copyWith(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge
          .copyWith(color: DarkThemeColors.textPrimary),
      headlineMedium: AppTextStyles.headlineMedium
          .copyWith(color: DarkThemeColors.textPrimary),
      headlineSmall: AppTextStyles.headlineSmall
          .copyWith(color: DarkThemeColors.textSecondary),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: DarkThemeColors.textPrimary),
      bodyMedium: AppTextStyles.bodyMedium
          .copyWith(color: DarkThemeColors.textSecondary),
      bodySmall: AppTextStyles.bodySmall
          .copyWith(color: DarkThemeColors.textSecondary),
      labelLarge: AppTextStyles.button.copyWith(color: Colors.white),
    ),
    // ignore: prefer_const_constructors
    buttonTheme: ButtonThemeData(
      buttonColor: DarkThemeColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
