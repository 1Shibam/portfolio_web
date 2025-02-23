import 'package:flutter/material.dart';
import 'package:portfolio_web/themes/colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Roboto';

  // Headings
  static const TextStyle headlineLarge = TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryText);

  static const TextStyle headlineMedium = TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText);

  static const TextStyle headlineSmall = TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText);

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText);

  static const TextStyle bodyMedium = TextStyle(
      fontFamily: fontFamily, fontSize: 16, color: AppColors.secondaryText);

  static const TextStyle bodySmall = TextStyle(
      fontFamily: fontFamily, fontSize: 14, color: AppColors.secondaryText);

  // Buttons
  static const TextStyle button = TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText);
}
