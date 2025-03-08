import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/app.dart';
import 'package:portfolio_web/responsive/desktop/desktop_screen_layout.dart';
import 'package:portfolio_web/responsive/mobile/mobile_screen_layout.dart';
import 'package:portfolio_web/responsive/tablet/tablet_screen_layout.dart';
import 'package:portfolio_web/screens/landing_screen.dart';

GoRouter router = GoRouter(initialLocation: '/landing', routes: [
  GoRoute(
    path: '/landing',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const LandingScreen(),
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child);
        },
      );
    },
  ),
  GoRoute(
    path: '/responsive',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const ResponsiveDesignScreen(
          desktop: DesktopScreenLayout(),
          tablet: TabletScreenLayout(),
          mobile: MobileScreenLayout(),
        ),
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child);
        },
      );
    },
  ),
]);
