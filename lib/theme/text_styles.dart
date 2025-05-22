import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'fonts.dart';

class AppTextStyles {
  static const double _normalSize = 16;
  static const double _boldSize = 20;
  static const double _headingSize = 40;
  static const double _heading2Size = 28;
  static const double _subheadingSize = 24;
  static const double _subheading2Size = 20;
  static const double _buttonSize = 16;

  static TextStyle normal(BuildContext context) => const TextStyle(
        fontFamily: nuraNormal,
        fontWeight: FontWeight.normal,
        fontSize: _normalSize,
        color: AppColors.light,
      );

  static TextStyle medium(BuildContext context) => const TextStyle(
        fontFamily: nuraMedium,
        fontWeight: FontWeight.w500,
        fontSize: _normalSize,
        color: Color.fromARGB(255, 165, 215, 214),
      );

  static TextStyle bold(BuildContext context) => const TextStyle(
        fontFamily: nuraBold,
        fontWeight: FontWeight.bold,
        fontSize: _boldSize,
        color: AppColors.light,
      );

  static TextStyle heading(BuildContext context) => const TextStyle(
        fontFamily: nuraBold,
        fontWeight: FontWeight.bold,
        fontSize: _headingSize,
        color: AppColors.light,
      );

  static TextStyle heading2(BuildContext context) => const TextStyle(
        fontFamily: nuraBold,
        fontWeight: FontWeight.bold,
        fontSize: _heading2Size,
        color: AppColors.light,
      );

  static TextStyle subheading(BuildContext context) => const TextStyle(
        fontFamily: nuraMedium,
        fontWeight: FontWeight.w500,
        fontSize: _subheadingSize,
        color: Color.fromARGB(255, 165, 215, 214),
      );

  static TextStyle subheading2(BuildContext context) => const TextStyle(
        fontFamily: nuraMedium,
        fontWeight: FontWeight.w500,
        fontSize: _subheading2Size,
        color: Color.fromARGB(255, 165, 215, 214),
      );

  static TextStyle button(BuildContext context) => const TextStyle(
        fontFamily: nuraBold,
        fontWeight: FontWeight.bold,
        fontSize: _buttonSize,
        letterSpacing: 1.2,
        color: Color.fromARGB(255, 165, 215, 214),
      );
}
