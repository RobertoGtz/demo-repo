import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/widgets/promotional_banner_carousel.dart';

void main() {
  group('PromotionalBannerCarousel Widget Tests', () {
    testWidgets('should display promotional banners', (WidgetTester tester) async {
      // Define a list of promotional banners
      final List<String> banners = [
        'Banner 1',
        'Banner 2',
        'Banner 3',
      ];

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PromotionalBannerCarousel(banners: banners),
          ),
        ),
      );

      // Verify if the first banner is displayed
      expect(find.text('Banner 1'), findsOneWidget);

      // Swipe to the next banner
      await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000.0);
      await tester.pumpAndSettle();

      // Verify if the second banner is displayed
      expect(find.text('Banner 2'), findsOneWidget);

      // Swipe to the next banner
      await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000.0);
      await tester.pumpAndSettle();

      // Verify if the third banner is displayed
      expect(find.text('Banner 3'), findsOneWidget);
    });

    testWidgets('should loop back to the first banner after the last', (WidgetTester tester) async {
      // Define a list of promotional banners
      final List<String> banners = [
        'Banner 1',
        'Banner 2',
        'Banner 3',
      ];

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PromotionalBannerCarousel(banners: banners),
          ),
        ),
      );

      // Swipe to the last banner
      await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000.0);
      await tester.pumpAndSettle();
      await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000.0);
      await tester.pumpAndSettle();

      // Verify if the third banner is displayed
      expect(find.text('Banner 3'), findsOneWidget);

      // Swipe to loop back to the first banner
      await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000.0);
      await tester.pumpAndSettle();

      // Verify if the first banner is displayed again
      expect(find.text('Banner 1'), findsOneWidget);
    });
  });
}