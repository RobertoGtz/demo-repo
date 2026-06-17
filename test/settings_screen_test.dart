import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/presentation/screens/settings_screen.dart';

void main() {
  testWidgets('Settings screen displays correctly', (WidgetTester tester) async {
    // Build the SettingsScreen widget.
    await tester.pumpWidget(const MaterialApp(
      home: SettingsScreen(),
    ));

    // Verify the presence of list tiles.
    expect(find.text('Account'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Privacy'), findsOneWidget);
    expect(find.text('Help & Support'), findsOneWidget);
  });
}
