import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/screens/profile_screen.dart';

void main() {
  group('ProfileScreen Widget Tests', () {
    testWidgets('ProfileScreen displays user information', (WidgetTester tester) async {
      // Build the ProfileScreen widget.
      await tester.pumpWidget(
        const MaterialApp(
          home: ProfileScreen(),
        ),
      );

      // Verify if the ProfileScreen contains specific widgets or text.
      expect(find.text('User Profile'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('ProfileScreen has an edit button', (WidgetTester tester) async {
      // Build the ProfileScreen widget.
      await tester.pumpWidget(
        const MaterialApp(
          home: ProfileScreen(),
        ),
      );

      // Verify if the edit button is present.
      expect(find.byIcon(Icons.edit), findsOneWidget);
    });

    testWidgets('Edit button navigates to EditProfileScreen', (WidgetTester tester) async {
      // Define a mock navigator observer.
      final mockObserver = MockNavigatorObserver();

      // Build the ProfileScreen widget with a navigator observer.
      await tester.pumpWidget(
        MaterialApp(
          home: const ProfileScreen(),
          navigatorObservers: [mockObserver],
        ),
      );

      // Tap the edit button.
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      // Verify if the navigation to EditProfileScreen occurred.
      verify(mockObserver.didPush(any, any));
    });
  });
}

// Mock class for NavigatorObserver
class MockNavigatorObserver extends Mock implements NavigatorObserver {}