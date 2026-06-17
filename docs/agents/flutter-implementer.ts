/**
 * Custom Implementer agent — demo-repo (Flutter / Clean MVVM)
 * Loaded dynamically by PluginLoader. Uses GAIA_HARNESS_ROOT to resolve harness.
 */

const PROJECT_CONTEXT = `
## Project: demo-repo — Flutter / Clean Architecture + MVVM

### Implementation rules (MUST follow)
- Place new screens in:     lib/src/presentation/screens/{name}_screen.dart
- Place new widgets in:     lib/src/presentation/widgets/{name}_widget.dart
- Place new viewmodels in:  lib/src/presentation/viewmodels/{name}_viewmodel.dart
- Place new models in:      lib/src/domain/models/{name}.dart
- Place repositories in:    lib/src/data/repositories/{name}_repository.dart
- Place services in:        lib/src/data/services/{name}_service.dart
- Place tests in:           test/{feature}/{name}_test.dart

### Code rules
- Screens must use StatelessWidget or ConsumerWidget (Riverpod). No StatefulWidget at screen level.
- State management via Riverpod/Provider only — never call setState in screens.
- Never import dart:io directly — use platform abstractions.
- All public methods and classes must have ///  dartdoc comments.
- No hardcoded strings — use AppStrings constants.
- Colors must come from Theme.of(context) — no hardcoded Color(0xFF...) values.
- Navigation via GoRouter or named routes — never raw Navigator.push.
- UI layer must never call a service directly — always go through a repository.

### Test rules
- Every new screen → widget test in test/{feature}/{name}_test.dart
- Every new ViewModel → unit test covering happy path, empty state, error state.
- Use flutter_test package only.
- Mocks via mockito or mocktail.

### Forbidden files — NEVER modify
- lib/main.dart, pubspec.yaml, android/, ios/, web/, macos/, linux/, windows/
`.trim();

const harnessRoot = process.env.GAIA_HARNESS_ROOT!;
const { ImplementerAgent } = require(`${harnessRoot}/dist/agents/implementer`);

export default class FlutterImplementer extends ImplementerAgent {
  name = 'FlutterImplementer';

  async execute(context: any): Promise<any> {
    context.job.platform = 'flutter';
    context.extraPromptContext = PROJECT_CONTEXT;
    return super.execute(context);
  }
}
