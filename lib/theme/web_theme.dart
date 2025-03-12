import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';

ThemeData webAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    scrollbarTheme: ScrollbarThemeData(
        interactive: true,
        thumbColor: const WidgetStatePropertyAll(AppColors.light),
        trackColor: WidgetStatePropertyAll(AppColors.light.withOpacity(0.05))),
    drawerTheme: DrawerThemeData(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
            side: BorderSide(
                color: AppColors.light.withOpacity(0.6), width: 1))));
