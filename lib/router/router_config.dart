import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  )
]);
