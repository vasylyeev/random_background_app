import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:random_background_app/core/app_routes.dart';
import 'package:random_background_app/core/resources/resources.dart';

/// Represents the splash screen of the application.
class SplashScreen extends StatelessWidget {
  /// Constructs a [SplashScreen] instance.
  ///
  /// The [key] parameter is optional and specifies a key to use for the widget.
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _View();
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) context.go(AppRoutes.toHomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Text(
          'RANDOM BACKGROUND APP',
          style: AppTextStyles.size14MediumWhite,
        ),
      ),
    );
  }
}
