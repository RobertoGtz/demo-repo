# Gaia Agent Rules — demo-repo (Flutter)

> These rules are injected into every agent prompt. Follow them strictly when generating, modifying, or reviewing code in this repository.

---

## Architecture

This project follows **Clean Architecture with MVVM**. Layers must not be crossed:

- `presentation/` → only calls ViewModels. Never touches repositories or services directly.
- `domain/` → pure Dart, no Flutter imports. Contains models and repository interfaces.
- `data/` → implements repository interfaces. Calls services/APIs.

---

## Code Rules

- All screens must extend `StatelessWidget` or use `ConsumerWidget` (Riverpod). Do **not** use `StatefulWidget` at the screen level unless explicitly justified in the spec.
- State management via **provider** or **riverpod** only. Never call `setState` in screen-level widgets.
- Never import `dart:io` directly — use platform abstractions.
- All public methods and classes must have `///` dartdoc comments.
- No hardcoded strings in the UI — use an `AppStrings` constant class.
- Colors must come from `Theme.of(context)` — never use hardcoded `Color(0xFF...)` values.
- Navigation must use **named routes** or **GoRouter** — no raw `Navigator.push(MaterialPageRoute(...))`.
- The UI layer must never call a service directly — always go through a repository.

---

## Test Rules

- Every new screen must have a corresponding widget test in `test/`.
- Every new ViewModel must have a unit test.
- Test file naming: `{feature_name}_test.dart` — must mirror the source file path under `test/`.
- Use the `flutter_test` package only — no third-party test runners.
- Each test file must cover at minimum: **happy path**, **empty/null state**, and **error state**.
- Mocks must use `mockito` or `mocktail` — avoid manual fakes unless the class is trivially simple.

---

## What NOT to do

- Do **not** modify `lib/main.dart` — it is the app entry point and is off-limits.
- Do **not** add packages to `pubspec.yaml` unless the task explicitly requires a new dependency.
- Do **not** touch `android/`, `ios/`, `web/`, `macos/`, `linux/`, or `windows/` directories.
- Do **not** commit generated files (`build/`, `.dart_tool/`, `*.g.dart` unless intentional).
