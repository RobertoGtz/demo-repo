import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/widgets/avatar_widget.dart';

void main() {
  group('AvatarWidget Tests', () {
    testWidgets('should display default avatar when no image is provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AvatarWidget(),
          ),
        ),
      );

      final defaultAvatarFinder = find.byType(Icon);
      expect(defaultAvatarFinder, findsOneWidget);
    });

    testWidgets('should display image when image URL is provided', (WidgetTester tester) async {
      const imageUrl = 'https://example.com/avatar.png';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AvatarWidget(imageUrl: imageUrl),
          ),
        ),
      );

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);
    });

    testWidgets('should have correct size', (WidgetTester tester) async {
      const avatarSize = 50.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AvatarWidget(size: avatarSize),
          ),
        ),
      );

      final avatarFinder = find.byType(AvatarWidget);
      final avatarWidget = tester.widget<AvatarWidget>(avatarFinder);

      expect(avatarWidget.size, equals(avatarSize));
    });
  });
}