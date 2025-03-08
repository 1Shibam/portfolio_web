import 'package:flutter/material.dart';

import 'fonts.dart';

class AppTextStyles {
  static const TextStyle normal = TextStyle(
    fontFamily: nuraNormal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: Colors.white, // Adjust color as needed
  );

  static const TextStyle medium = TextStyle(
    fontFamily: nuraMedium,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: Colors.white,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: nuraBold,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.white,
  );

  static const TextStyle heading = TextStyle(
    fontFamily: nuraBold,
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: Colors.white,
  );

  static const TextStyle subheading = TextStyle(
    fontFamily: nuraMedium,
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: Colors.white,
  );

  static const TextStyle button = TextStyle(
    fontFamily: nuraBold,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 1.2,
    color: Colors.white,
  );
}