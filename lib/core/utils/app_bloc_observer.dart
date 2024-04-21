import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A custom [BlocObserver] implementation for observing
/// BLoC events and states in the application.
class AppBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase<Object?> bloc) {
    super.onCreate(bloc);
    log('${bloc.runtimeType}()');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (event == null) return;
    log('${bloc.runtimeType}.add(${event.runtimeType})');
    final Object? state = bloc.state;
    if (state == null) return;
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    final Object? event = transition.event;
    final Object? currentState = transition.currentState;
    final Object? nextState = transition.nextState;
    if (event == null || currentState == null || nextState == null) return;
    log('${currentState.runtimeType}->${nextState.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log(error.toString(), stackTrace: stackTrace);
    _ErrorUtil.logError(
      error,
      stackTrace: stackTrace,
      hint: 'BLoC: ${bloc.runtimeType}',
    );
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    super.onClose(bloc);
    log('${bloc.runtimeType}.close()');
  }
}

//MARK: - ErrorUtil
sealed class _ErrorUtil {
  _ErrorUtil._();

  static void logError(
    Object exception, {
    StackTrace? stackTrace,
    String? hint,
  }) {
    try {
      if (exception is String) {
        return logMessage(
          exception,
          stackTrace: stackTrace,
          hint: hint,
          warning: true,
        );
      }
      log(
        exception.toString(),
        stackTrace: stackTrace ?? StackTrace.current,
      );
    } on Object catch (error, stackTrace) {
      log(
        'Exception in  "$error" в ErrorUtil.logError',
        stackTrace: stackTrace,
      );
    }
  }

  static void logMessage(
    String message, {
    StackTrace? stackTrace,
    String? hint,
    bool warning = false,
  }) {
    try {
      log(message, stackTrace: stackTrace);
    } on Object catch (error, stackTrace) {
      log(
        'Exp happened "$error" in ErrorUtil.logMessage',
        stackTrace: stackTrace,
      );
    }
  }
}
