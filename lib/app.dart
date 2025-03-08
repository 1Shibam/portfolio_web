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