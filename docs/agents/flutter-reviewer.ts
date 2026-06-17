/**
 * Custom Reviewer agent — demo-repo (Flutter / Clean MVVM)
 * Loaded dynamically by PluginLoader. Uses GAIA_HARNESS_ROOT to resolve harness.
 */

const REVIEW_CHECKLIST = `
## PR Review Checklist — demo-repo (Flutter)

### Architecture compliance
- [ ] Screens use StatelessWidget or ConsumerWidget only — no StatefulWidget at screen level.
- [ ] ViewModels handle all state — no business logic in screens.
- [ ] Domain layer has zero Flutter imports.
- [ ] Data layer only calls services/APIs — never called directly from screens.

### Code quality
- [ ] No hardcoded strings — all literals use AppStrings.
- [ ] No hardcoded colors — all use Theme.of(context).
- [ ] Navigation via GoRouter or named routes only.
- [ ] All public symbols have /// dartdoc comments.
- [ ] No dart:io imports — platform abstractions used.

### Test coverage
- [ ] Every new screen has a widget test (happy path + error + empty state).
- [ ] Every new ViewModel has unit tests.
- [ ] Tests use flutter_test + mockito/mocktail.
- [ ] Test files mirror source paths under test/.

### Forbidden files check
- [ ] lib/main.dart NOT modified.
- [ ] pubspec.yaml NOT modified (unless task required new dependency).
- [ ] android/, ios/, web/, macos/, linux/, windows/ NOT modified.
`.trim();

const harnessRoot = process.env.GAIA_HARNESS_ROOT!;
const { ReviewerAgent } = require(`${harnessRoot}/dist/agents/reviewer`);

export default class FlutterReviewer extends ReviewerAgent {
  name = 'FlutterReviewer';

  async execute(context: any): Promise<any> {
    context.job.platform = 'flutter';
    context.extraPromptContext = REVIEW_CHECKLIST;
    return super.execute(context);
  }
}
