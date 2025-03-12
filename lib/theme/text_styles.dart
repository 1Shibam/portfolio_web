import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';

import 'fonts.dart';

double adaptiveFontSize(BuildContext context, double baseSize) {
  double width = MediaQuery.of(context).size.width;

  if (width < 600) {
    return baseSize * 0.9; // Small screens (mobile)
  } else if (width < 1200) {
    return baseSize; // Medium screens (tablets)
  } else {
    return baseSize * 1.2; // Large screens (desktop)
  }
}

class AppTextStyles {
  static TextStyle normal(BuildContext context) => TextStyle(
        fontFamily: nuraNormal,
        fontWeight: FontWeight.normal,
        fontSize: adaptiveFontSize(context, 16),
        color: AppColors.light,
      );

  static TextStyle medium(BuildContext context) => TextStyle(
        fontFamily: nuraMedium,
        fontWeight: FontWeight.w500,
        fontSize: adaptiveFontSize(context, 16),
        color: const Color.fromARGB(255, 165, 215, 214),
      );

  static TextStyle bold(BuildContext context) => TextStyle(
        fontFamily: nuraBold,
        fontWeight: FontWeight.bold,
        fontSize: adaptiveFontSize(context, 20),
        color: AppColors.light,
      );

  static TextStyle heading(BuildContext context) => TextStyle(
      fontFamily: nuraBold,
      fontWeight: FontWeight.bold,
      fontSize: adaptiveFontSize(context, 40),
      color: AppColors.light);
  static TextStyle heading2(BuildContext context) => TextStyle(
      fontFamily: nuraBold,
      fontWeight: FontWeight.bold,
      fontSize: adaptiveFontSize(context, 28),
      color: AppColors.light);

  static TextStyle subheading(BuildContext context) => TextStyle(
        fontFamily: nuraMedium,
        fontWeight: FontWeight.w500,
        fontSize: adaptiveFontSize(context, 24),
        color: const Color.fromARGB(255, 165, 215, 214),
      );
  static TextStyle subheading2(BuildContext context) => TextStyle(
        fontFamily: nuraMedium,
        fontWeight: FontWeight.w500,
        fontSize: adaptiveFontSize(context, 20),
        color: const Color.fromARGB(255, 165, 215, 214),
      );

  static TextStyle button(BuildContext context) => TextStyle(
        fontFamily: nuraBold,
        fontWeight: FontWeight.bold,
        fontSize: adaptiveFontSize(context, 16),
        letterSpacing: 1.2,
        color: const Color.fromARGB(255, 165, 215, 214),
      );
}
