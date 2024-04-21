import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_background_app/core/injection_container.dart';
import 'package:random_background_app/features/home/cubit/home_cubit.dart';
import 'package:random_background_app/features/home/widgets/home_resources.dart';

/// Represents the home screen of the application.
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen] instance.
  ///
  /// The [key] parameter is optional and specifies a key to use for the widget.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<HomeCubit>().generateRandomColor(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (_, state) {
          return Scaffold(
            backgroundColor: state.backgroundColor,
            body: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _HelloThereText(),
                SizedBox(height: 40),
                _SaveColorButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _HelloThereText extends StatelessWidget {
  const _HelloThereText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (_, state) {
        return HelloThereText(
          color: state.textColor,
        );
      },
    );
  }
}

class _SaveColorButton extends StatelessWidget {
  const _SaveColorButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (_, state) {
        return SaveColorButton(
          onPressed: () async {
            final color = state.backgroundColor;
            await context
                .read<HomeCubit>()
                .saveColorToClipboard(color)
                .whenComplete(() {
              ScaffoldMessenger.of(context).showSnackBar(_successSnackBar);
            });
          },
        );
      },
    );
  }
}

const SnackBar _successSnackBar = SnackBar(
  content: Text('Background Color has been successfully saved'),
  duration: Duration(seconds: 2),
);
