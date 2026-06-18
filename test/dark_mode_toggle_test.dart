import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/presentation/widgets/dark_mode_toggle.dart';

void main() {
  group('DarkModeToggle Widget Tests', () {
    testWidgets('should toggle dark mode on tap', (WidgetTester tester) async {
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

      // Verify initial state is light mode
      expect(find.byIcon(Icons.dark_mode), findsNothing);
      expect(find.byIcon(Icons.light_mode), findsOneWidget);

      // Tap the toggle button
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      // Verify the state is now dark mode
      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
      expect(find.byIcon(Icons.light_mode), findsNothing);
    });

    testWidgets('should display correct icon based on isDarkMode', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DarkModeToggle(
              isDarkMode: true,
              onToggle: (_) {},
            ),
          ),
        ),
      );

      // Verify the icon is dark mode
      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
      expect(find.byIcon(Icons.light_mode), findsNothing);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DarkModeToggle(
              isDarkMode: false,
              onToggle: (_) {},
            ),
          ),
        ),
      );

      // Verify the icon is light mode
      expect(find.byIcon(Icons.dark_mode), findsNothing);
      expect(find.byIcon(Icons.light_mode), findsOneWidget);
    });
  });
}