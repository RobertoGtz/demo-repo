import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/presentation/widgets/username_widget.dart';

void main() {
  group('UsernameWidget Tests', () {
    testWidgets('displays the correct username', (WidgetTester tester) async {
      // Arrange
      const username = 'TestUser';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UsernameWidget(username: username),
          ),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.text(username), findsOneWidget);
    });

    testWidgets('displays default text when username is empty', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UsernameWidget(username: ''),
          ),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.text('No Username'), findsOneWidget);
    });
  });
}