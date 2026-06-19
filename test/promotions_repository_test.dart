test/promotions_repository_test.dart

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/data/promotions_repository.dart';
import 'package:demo_repo/src/domain/promotion.dart';

void main() {
  group('PromotionsRepository', () {
    late PromotionsRepository promotionsRepository;

    setUp(() {
      promotionsRepository = PromotionsRepository();
    });

    test('should return a list of promotions', () async {
      final promotions = await promotionsRepository.getPromotions();
      expect(promotions, isA<List<Promotion>>());
      expect(promotions.isNotEmpty, true);
    });

    test('should return promotions with valid data', () async {
      final promotions = await promotionsRepository.getPromotions();
      for (var promotion in promotions) {
        expect(promotion.id, isNotNull);
        expect(promotion.title, isNotEmpty);
        expect(promotion.description, isNotEmpty);
      }
    });
  });
}