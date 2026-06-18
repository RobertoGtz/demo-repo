import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/domain/toggle_dark_mode_usecase.dart';

void main() {
  group('ToggleDarkModeUseCase', () {
    late ToggleDarkModeUseCase toggleDarkModeUseCase;

    setUp(() {
      toggleDarkModeUseCase = ToggleDarkModeUseCase();
    });

    test('should toggle dark mode from false to true', () {
      // Initial state is assumed to be false
      expect(toggleDarkModeUseCase.isDarkModeEnabled, isFalse);

      toggleDarkModeUseCase.toggle();

      expect(toggleDarkModeUseCase.isDarkModeEnabled, isTrue);
    });

    test('should toggle dark mode from true to false', () {
      // Set initial state to true
      toggleDarkModeUseCase.toggle(); // First toggle to true

      expect(toggleDarkModeUseCase.isDarkModeEnabled, isTrue);

      toggleDarkModeUseCase.toggle(); // Second toggle to false

      expect(toggleDarkModeUseCase.isDarkModeEnabled, isFalse);
    });
  });
}