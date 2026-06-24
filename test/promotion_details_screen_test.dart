import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/screens/promotion_details_screen.dart';

void main() {
  group('PromotionDetailsScreen Tests', () {
    testWidgets('should display promotion title', (WidgetTester tester) async {
      // Arrange
      const promotionTitle = 'Special Offer';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: PromotionDetailsScreen(title: promotionTitle),
        ),
      );

      // Assert
      expect(find.text(promotionTitle), findsOneWidget);
    });

    testWidgets('should display promotion description', (WidgetTester tester) async {
      // Arrange
      const promotionDescription = 'Get 50% off on all items!';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: PromotionDetailsScreen(description: promotionDescription),
        ),
      );

      // Assert
      expect(find.text(promotionDescription), findsOneWidget);
    });

    testWidgets('should display promotion image', (WidgetTester tester) async {
      // Arrange
      const imageUrl = 'https://example.com/promotion.png';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: PromotionDetailsScreen(imageUrl: imageUrl),
        ),
      );

      // Assert
      expect(find.byType(Image), findsOneWidget);
    });
  });
}