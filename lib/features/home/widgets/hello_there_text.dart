import 'package:flutter/material.dart';
import 'package:random_background_app/core/resources/app_text_styles.dart';

/// A text widget that displays "Hello there" with a specified color.
class HelloThereText extends StatelessWidget {

  /// Constructs a [HelloThereText] instance.
  ///
  /// The [color] parameter specifies the color of the text.
  const HelloThereText({
    required this.color,
    super.key,
  });

  /// The color of the text.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello there',
        style: AppTextStyles.size14Medium.copyWith(
          color: color,
        ),
      ),
    );
  }
}
