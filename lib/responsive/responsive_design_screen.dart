import 'package:flutter/material.dart';

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen(
      {super.key,
      required this.desktop,
      required this.tablet,
      required this.mobile});

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width >= 1366) {
          return desktop;
        } else if (width < 1366 && width >= 768) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}