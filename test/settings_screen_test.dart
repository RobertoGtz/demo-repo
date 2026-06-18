import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/screens/settings_screen.dart';
import 'package:demo_repo/src/presentation/widgets/dark_mode_toggle.dart';

void main() {
  group('SettingsScreen Tests', () {
    testWidgets('SettingsScreen displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsScreen(),
        ),
      );

      expect(find.text('Settings'), findsOneWidget);
      expect(find.byType(DarkModeToggle), findsOneWidget);
    });
  });

  group('DarkModeToggle Tests', () {
    testWidgets('DarkModeToggle toggles state', (WidgetTester tester) async {
      bool isDarkMode = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return DarkModeToggle(
                  isDarkMode: isDarkMode,
                  onToggle: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.dark_mode), findsNothing);
      expect(find.byIcon(Icons.light_mode), findsOneWidget);

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(isDarkMode, isTrue);
      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
      expect(find.byIcon(Icons.light_mode), findsNothing);
    });
  });
}