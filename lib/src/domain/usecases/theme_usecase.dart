import 'package:flutter/material.dart';

class ThemeUseCase {
  final ValueNotifier<ThemeMode> themeModeNotifier;

  ThemeUseCase({ThemeMode initialMode = ThemeMode.light})
      : themeModeNotifier = ValueNotifier<ThemeMode>(initialMode);

  void toggleTheme() {
    themeModeNotifier.value =
        themeModeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeMode get currentThemeMode => themeModeNotifier.value;
}
