import 'package:go_router/go_router.dart';
import 'package:portfolio_web/screens/home_page.dart';

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomePage();
    },
  )
]);
