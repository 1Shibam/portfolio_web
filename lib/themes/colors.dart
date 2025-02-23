import 'package:flutter/material.dart';

class DarkThemeColors {
  static const Color background = Color(0xFF121212); // Dark Gray
  static const Color surface = Color(0xFF1E1E1E); // Slightly lighter gray
  static const Color primary =
      Color.fromARGB(255, 134, 193, 252); // Soft purple accent
  static const Color secondary = Color(0xFF03DAC6); // Subtle teal
  static const Color text = Color(0xFFE0E0E0); // Light gray
}

class LightThemeColors {
  static const Color background = Color(0xFFFFFFFF); // Pure White
  static const Color surface = Color(0xFFF5F5F5); // Soft Gray
  static const Color primary = Color.fromARGB(255, 15, 165, 228); // Deep purple
  static const Color secondary = Color(0xFF018786); // Muted teal
  static const Color text = Color(0xFF212121); // Dark gray for readability
}
