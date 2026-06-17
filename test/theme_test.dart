import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/screens/settings_screen.dart';

void main() {
  group('Theme Persistence and Application', () {
    testWidgets('Toggle dark mode and verify persistence', (WidgetTester tester) async {
      // Build the SettingsScreen widget
      await tester.pumpWidget(MaterialApp(
        home: const SettingsScreen(),
      ));

      // Verify initial theme is light
      expect(find.byIcon(Icons.light_mode), findsOneWidget);

      // Tap the toggle button to switch to dark mode
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      // Verify the theme is now dark
      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    });
  });
}
