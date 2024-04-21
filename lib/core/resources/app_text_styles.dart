import 'package:flutter/material.dart';
import 'package:random_background_app/core/resources/app_colors.dart';

/// A utility class that provides predefined text styles for the application.
sealed class AppTextStyles {
  static const String _inter = 'Inter';

  static const double _size14 = 14;

  static const FontWeight _medium = FontWeight.w500;

  /// A predefined text style with a font size of 14 and medium font weight.
  static const TextStyle size14Medium = TextStyle(
    fontFamily: _inter,
    fontSize: _size14,
    fontWeight: _medium,
  );

  /// A predefined text style with a font size of 14
  /// and medium font weight and color white.
  static const TextStyle size14MediumWhite = TextStyle(
    fontFamily: _inter,
    fontSize: _size14,
    fontWeight: _medium,
    color: AppColors.white,
  );
}
