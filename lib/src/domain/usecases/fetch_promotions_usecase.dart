lib/src/domain/usecases/fetch_promotions_usecase.dart

```dart
import 'package:demo_repo/src/domain/entities/promotion.dart';
import 'package:demo_repo/src/domain/repositories/promotion_repository.dart';

class FetchPromotionsUseCase {
  final PromotionRepository promotionRepository;

  FetchPromotionsUseCase(this.promotionRepository);

  Future<List<Promotion>> execute() async {
    return await promotionRepository.getPromotions();
  }
}