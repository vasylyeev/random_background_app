import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_background_app/core/utils/color_utils.dart';

/// A Cubit responsible for managing the state of the home screen.
class HomeCubit extends Cubit<HomeState> {
  final ColorUtils _colorUtils;

  /// Constructs a [HomeCubit] instance.
  ///
  /// The [colorUtils] parameter is required and specifies
  /// the color utils to use.
  HomeCubit({required ColorUtils colorUtils})
      : _colorUtils = colorUtils,
        super(
          const HomeState(
            backgroundColor: Colors.white,
            textColor: Colors.black,
          ),
        );

  /// Generates a random color for background and a contrasting color
  /// for text and updates the state with the new colors.
  void generateRandomColor() {
    final Color backgroundColor = _colorUtils.generateRandomColor();
    final Color textColor = _colorUtils.getContrastingColor(
      backgroundColor,
    );
    emit(
      state.copyWith(
        backgroundColor: backgroundColor,
        textColor: textColor,
      ),
    );
  }

  /// Generates a hex of a color and saves it to the clipboard.
  Future<void> saveColorToClipboard(Color color) async {
    final String hex = _colorUtils.getColorHex(color);
    await _copyToClipboard(hex);
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}

// MARK: - State

/// Represents the state of the home screen.
@immutable
final class HomeState {
  /// The background color of the home screen.
  final Color backgroundColor;

  /// The text color of the home screen.
  final Color textColor;

  /// Constructs a [HomeState] instance.
  ///
  /// The [backgroundColor] parameter specifies the background color.
  ///
  /// The [textColor] parameter specifies the text color.
  const HomeState({
    required this.backgroundColor,
    required this.textColor,
  });

  /// Creates a new [HomeState] object with updated properties.
  ///
  /// If [backgroundColor] is not provided, it
  /// defaults to the current background color.
  ///
  /// If [textColor] is not provided, it
  /// defaults to the current text color.
  HomeState copyWith({
    Color? backgroundColor,
    Color? textColor,
  }) {
    return HomeState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }
}
