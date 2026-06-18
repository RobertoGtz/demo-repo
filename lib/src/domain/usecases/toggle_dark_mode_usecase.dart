lib/src/domain/usecases/toggle_dark_mode_usecase.dart
```dart
import 'package:flutter/material.dart';

class ToggleDarkModeUseCase {
  final ValueNotifier<ThemeMode> themeModeNotifier;

  ToggleDarkModeUseCase(this.themeModeNotifier);

  void toggle() {
    if (themeModeNotifier.value == ThemeMode.light) {
      themeModeNotifier.value = ThemeMode.dark;
    } else {
      themeModeNotifier.value = ThemeMode.light;
    }
  }
}