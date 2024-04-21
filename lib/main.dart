import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:random_background_app/core/injection_container.dart' as di;
import 'package:random_background_app/core/utils/app_bloc_observer.dart';
import 'package:random_background_app/my_app/view/my_app.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.initDi();
    Bloc.observer = AppBlocObserver();
    runApp(const MyApp());
  }, (e, s) async {
    log(e.toString());
    log(s.toString());
  });
}
