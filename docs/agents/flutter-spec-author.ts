/**
 * Custom SpecAuthor agent — demo-repo (Flutter / Clean MVVM)
 *
 * Loaded dynamically by PluginLoader via import(absolutePath).
 * No external imports needed: the harness injects all tools via context.
 * Implements the duck-typed {name, execute(context)} contract.
 */

const PROJECT_CONTEXT = `
## Project: demo-repo — Flutter / Clean Architecture + MVVM

### Architecture layers (MUST respect)
- presentation/screens/    → StatelessWidget or ConsumerWidget (Riverpod). No business logic.
- presentation/viewmodels/ → all UI state via StateNotifier / ChangeNotifier.
- domain/models/           → pure Dart, zero Flutter imports.
- data/repositories/       → implements domain interfaces, calls services.

### File path patterns
- Screen:     lib/src/presentation/screens/{name}_screen.dart
- Widget:     lib/src/presentation/widgets/{name}_widget.dart
- ViewModel:  lib/src/presentation/viewmodels/{name}_viewmodel.dart
- Model:      lib/src/domain/models/{name}.dart
- Repository: lib/src/data/repositories/{name}_repository.dart
- Service:    lib/src/data/services/{name}_service.dart
- Test:       test/{feature}/{name}_test.dart

### Naming conventions
- Classes: PascalCase | Files: snake_case | Constants: kCamelCase

### Forbidden — NEVER spec tasks that touch these
- lib/main.dart, pubspec.yaml, android/, ios/, web/, macos/, linux/, windows/

### Spec requirements
- Every screen task MUST include a corresponding widget test task.
- Every ViewModel task MUST include a unit test task.
- State management: Riverpod/Provider only — never setState at screen level.
- All UI strings must use AppStrings constants — no hardcoded string literals.
- Navigation must use GoRouter or named routes — never raw Navigator.push.
- Colors must come from Theme.of(context) — no hardcoded Color(0xFF...) values.
`.trim();

const harnessRoot = process.env.GAIA_HARNESS_ROOT!;
const { SpecAuthorAgent } = require(`${harnessRoot}/dist/agents/spec-author`);

export default class FlutterSpecAuthor extends SpecAuthorAgent {
  name = 'FlutterSpecAuthor';

  async execute(context: any): Promise<any> {
    context.job.platform = 'flutter';
    context.extraPromptContext = PROJECT_CONTEXT;
    return super.execute(context);
  }
}
