import 'package:flutter/material.dart';
import 'package:portfolio_web/router/router_config.dart';

class PortfolioWeb extends StatelessWidget {
  const PortfolioWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

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
        if (width >= 1024) {
          return desktop;
        } else if (width > 768 && width < 1024) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
