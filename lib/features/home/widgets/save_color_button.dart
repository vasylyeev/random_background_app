import 'package:flutter/material.dart';

/// A button widget that triggers an action to save a color.
class SaveColorButton extends StatelessWidget {

  /// Constructs a [SaveColorButton] instance.
  ///
  /// The [onPressed] parameter is a callback function
  /// invoked when the button is pressed.
  const SaveColorButton({
    required this.onPressed,
    super.key,
  });

  /// A callback function triggered when the button is pressed.
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Save Color'),
      ),
    );
  }
}
