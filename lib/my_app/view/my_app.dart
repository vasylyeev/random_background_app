import 'package:flutter/material.dart';
import 'package:random_background_app/core/app_routes.dart';

/// MyApp is the main application widget.
///
/// It initializes the MaterialApp with a custom router.
class MyApp extends StatelessWidget {

  /// Constructs a new MyApp instance.
  ///
  /// The [key] parameter specifies a key to use for the widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
    );
  }
}
