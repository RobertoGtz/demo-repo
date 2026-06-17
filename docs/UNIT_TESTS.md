# Unit Test Guide — demo-repo (Flutter)

> This document defines how unit and widget tests must be written in this project.
> The agent must follow these patterns exactly when creating or modifying test files.

---

## Test Structure

Every test file must follow this structure:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Subject under test
import 'package:demo_repo/src/presentation/viewmodels/example_viewmodel.dart';

// Mocks
class MockExampleRepository extends Mock implements ExampleRepository {}

void main() {
  late ExampleViewModel sut;
  late MockExampleRepository mockRepository;

  setUp(() {
    mockRepository = MockExampleRepository();
    sut = ExampleViewModel(repository: mockRepository);
  });

  tearDown(() {
    // reset if needed
  });

  group('ExampleViewModel', () {
    group('loadData', () {
      test('emits loaded state when repository returns data', () async {
        // arrange
        when(() => mockRepository.fetchData()).thenAnswer((_) async => ['item1']);

        // act
        await sut.loadData();

        // assert
        expect(sut.state, isA<LoadedState>());
      });

      test('emits error state when repository throws', () async {
        // arrange
        when(() => mockRepository.fetchData()).thenThrow(Exception('network error'));

        // act
        await sut.loadData();

        // assert
        expect(sut.state, isA<ErrorState>());
      });

      test('emits empty state when repository returns empty list', () async {
        // arrange
        when(() => mockRepository.fetchData()).thenAnswer((_) async => []);

        // act
        await sut.loadData();

        // assert
        expect(sut.state, isA<EmptyState>());
      });
    });
  });
}
```

---

## Naming Conventions

| What | Convention | Example |
|---|---|---|
| Test file | `{source_file}_test.dart` | `home_screen_viewmodel_test.dart` |
| Test group | Class or method name | `group('HomeScreenViewModel', ...)` |
| Test case | Plain English sentence | `test('emits loading state before data arrives', ...)` |
| Mock class | `Mock{ClassName}` | `MockHomeRepository` |

---

## Required Test Cases per Class

### ViewModel
- Initial state is correct
- Loading state is emitted before async operations complete
- Success state is emitted with correct data
- Error state is emitted when dependency throws
- Empty state is emitted when result is an empty collection

### Repository
- Returns correct model when data source succeeds
- Throws domain exception when data source fails
- Handles null/empty response from data source

### Widget (screen-level)
- Renders correctly in default state (golden or finder-based)
- Displays loading indicator when state is loading
- Displays data when state is loaded
- Displays error message when state is error
- Displays empty message when state is empty

---

## Mocking Rules

- Use `mocktail` for all mocks — never write manual stub classes unless the interface has only one method
- Register fallback values with `registerFallbackValue()` in `setUpAll` for complex types
- Never mock the subject under test itself — only its dependencies
- Prefer `thenAnswer((_) async => ...)` for async stubs over `thenReturn(Future.value(...))`

---

## Coverage Requirements

- **ViewModels**: 100% of public methods must have tests
- **Repositories**: all `try/catch` branches must be exercised
- **Screens**: at minimum the loading, success, and error render states

---

## File Location

```
test/
├── presentation/
│   ├── screens/
│   │   └── home_screen_test.dart
│   └── viewmodels/
│       └── home_viewmodel_test.dart
└── data/
    └── repositories/
        └── home_repository_test.dart
```
