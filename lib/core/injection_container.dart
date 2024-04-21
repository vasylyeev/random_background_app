import 'package:get_it/get_it.dart';
import 'package:random_background_app/core/utils/color_utils.dart';
import 'package:random_background_app/features/home/cubit/home_cubit.dart';

/// Service locator instance used for dependency injection.
final sl = GetIt.I;

/// Initializes dependency injection for the application.
Future<void> initDi() async {

  sl.registerLazySingleton<ColorUtils>(ColorGeneratorImpl.new);

  sl.registerFactory(
    () => HomeCubit(
      colorUtils: sl(),
    ),
  );
}
