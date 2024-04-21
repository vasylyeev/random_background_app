import 'dart:math';
import 'package:flutter/material.dart';

/// An abstract interface for generating colors.
abstract interface class ColorUtils {

  /// Generates a random color.
  Color generateRandomColor();

  /// Generates a contrasting color.
  Color getContrastingColor(Color backgroundColor);

  /// Generates a hex of color.
  String getColorHex(Color color);

}

/// A concrete implementation of the [ColorUtils] interface.
class ColorGeneratorImpl implements ColorUtils {
  final Random _random = Random();

  @override
  Color generateRandomColor() {
    const int colorBits = 256;

    return Color.fromRGBO(
      _random.nextInt(colorBits),
      _random.nextInt(colorBits),
      _random.nextInt(colorBits),
      1,
    );
  }

  @override
  Color getContrastingColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();

    const threshold = 0.5;

    return luminance > threshold ? Colors.black : Colors.white;
  }

  @override
  String getColorHex(Color color) {
    const int radix = 16;
    const int substring = 2;

    return color.value.toRadixString(radix).substring(substring).toUpperCase();
  }
}
