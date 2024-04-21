import 'package:go_router/go_router.dart';
import 'package:random_background_app/features/home/view/home_screen.dart';
import 'package:random_background_app/features/splash/view/splash_screen.dart';

/// This class represents the routes used in the application.
/// It provides constants for route paths and initializes the GoRouter.
sealed class AppRoutes {

  /// Route path for navigating to the splash screen.
  static const toSplashScreen = '/';

  /// Route path for navigating to the home screen.
  static const toHomeScreen = '/toHomeScreen';

  /// Initializes the GoRouter with initial location and routes.
  static final GoRouter router = GoRouter(
    initialLocation: toSplashScreen,
    routes: _routes,
  );

  static final _routes = [
    GoRoute(
      path: toSplashScreen,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: toHomeScreen,
      builder: (_, __) => const HomeScreen(),
    ),
  ];
}
