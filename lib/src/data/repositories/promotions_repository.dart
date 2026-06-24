lib/src/data/repositories/promotions_repository.dart

```dart
import 'package:demo_repo/src/domain/models/promotion.dart';

class PromotionsRepository {
  // This method simulates fetching promotions from a data source.
  Future<List<Promotion>> fetchPromotions() async {
    // Simulated delay to mimic network request
    await Future.delayed(Duration(seconds: 2));

    // Returning a list of dummy promotions
    return [
      Promotion(id: 1, title: 'Summer Sale', description: 'Get 50% off on all items!'),
      Promotion(id: 2, title: 'Winter Clearance', description: 'Up to 70% off on selected items!'),
    ];
  }
}
```

lib/src/domain/models/promotion.dart

```dart
class Promotion {
  final int id;
  final String title;
  final String description;

  Promotion({required this.id, required this.title, required this.description});
}