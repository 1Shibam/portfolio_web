import 'package:go_router/go_router.dart';
import 'package:portfolio_web/responsive/responsive_layout.dart';

import 'package:portfolio_web/screens/mobile_screen_layout.dart';
import 'package:portfolio_web/screens/web_screen_layout.dart';

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      );
    },
  )
]);
