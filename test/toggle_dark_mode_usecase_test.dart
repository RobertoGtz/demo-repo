import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/domain/usecases/toggle_dark_mode_usecase.dart';

void main() {
  group('ToggleDarkModeUseCase', () {
    late ToggleDarkModeUseCase toggleDarkModeUseCase;
    late bool isDarkModeEnabled;

    setUp(() {
      isDarkModeEnabled = false;
      toggleDarkModeUseCase = ToggleDarkModeUseCase(
        isDarkModeEnabled: () => isDarkModeEnabled,
        setDarkModeEnabled: (bool value) {
          isDarkModeEnabled = value;
        },
      );
    });

    test('should toggle dark mode from false to true', () {
      toggleDarkModeUseCase.execute();
      expect(isDarkModeEnabled, true);
    });

    test('should toggle dark mode from true to false', () {
      isDarkModeEnabled = true;
      toggleDarkModeUseCase.execute();
      expect(isDarkModeEnabled, false);
    });
  });
}