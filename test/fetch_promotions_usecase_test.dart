test/fetch_promotions_usecase_test.dart

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/domain/fetch_promotions_usecase.dart';
import 'package:demo_repo/src/data/promotion_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([PromotionRepository])
void main() {
  group('FetchPromotionsUseCase', () {
    late MockPromotionRepository mockPromotionRepository;
    late FetchPromotionsUseCase fetchPromotionsUseCase;

    setUp(() {
      mockPromotionRepository = MockPromotionRepository();
      fetchPromotionsUseCase = FetchPromotionsUseCase(mockPromotionRepository);
    });

    test('should return a list of promotions when repository call is successful', () async {
      // Arrange
      final promotions = [Promotion(id: '1', title: 'Promo 1'), Promotion(id: '2', title: 'Promo 2')];
      when(mockPromotionRepository.fetchPromotions()).thenAnswer((_) async => promotions);

      // Act
      final result = await fetchPromotionsUseCase.execute();

      // Assert
      expect(result, promotions);
      verify(mockPromotionRepository.fetchPromotions()).called(1);
    });

    test('should throw an exception when repository call fails', () async {
      // Arrange
      when(mockPromotionRepository.fetchPromotions()).thenThrow(Exception('Failed to fetch promotions'));

      // Act & Assert
      expect(() => fetchPromotionsUseCase.execute(), throwsException);
      verify(mockPromotionRepository.fetchPromotions()).called(1);
    });
  });
}