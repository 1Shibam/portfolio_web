import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';

ThemeData webAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    drawerTheme: DrawerThemeData(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
            side: const BorderSide(color: AppColors.light, width: 2))));
