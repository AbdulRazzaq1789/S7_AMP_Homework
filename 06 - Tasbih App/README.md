# Week 06 — Tasbih App

**Advanced Mobile Programming | Independent Flutter homework project**

This is a complete **Dart/Flutter app source project** with Android/Web platform source scaffolding. The Flutter SDK generates its local/ephemeral build files (including the Gradle wrapper JAR and Android `local.properties`) on your computer.

> **Assignment note:** Lecture 06 slides were not supplied. The requested assignment title *Tasbih App* and feature scope (counting, goals, Undo, reset, saved progress) come from the student's instructions, not a verified Lecture 06 homework slide.

## Features

- Four dhikr choices, with Arabic labels and English meanings.
- Large accessible tap counter with animated circular progress.
- Repetition targets **33, 99, 100, 1000**.
- Separate progress for each dhikr; switching doesn't erase another phrase's count.
- **Undo** for the last tap, target change, or round reset.
- Reset confirmation; reset leaves lifetime totals and completed rounds intact.
- Completed-round feedback; tapping after completion begins a new round.
- Lifetime tap totals and completed rounds, with a separate Progress page.
- Persistent storage via `shared_preferences` on device/browser.
- Optional haptic feedback preference.
- Responsive scroll layout; functional Android and Web source scaffolding.

## Source organization

```text
lib/
  main.dart                       # Entry point
  app.dart                        # MaterialApp
  models/dhikr.dart               # Dhikr catalog and labels
  models/tasbih_data.dart         # Immutable model + JSON serialization
  services/tasbih_store.dart      # Persistence interface
  services/shared_preferences_tasbih_store.dart
  state/tasbih_controller.dart    # Business rules, state, serialized saves
  screens/tasbih_shell.dart       # Navigation, dialogs, haptics
  screens/counter_screen.dart     # Main counter interface
  screens/progress_screen.dart    # Lifetime and per-dhikr statistics
  theme/app_theme.dart            # Shared colors + typography
  widgets/                       # Counter dial, selectors and cards
```

## Run

1. Install a recent stable Flutter SDK and Android Studio or a browser target.
2. Extract this ZIP and open `Week_06_Tasbih_App/` in VS Code / Android Studio.
3. Run from the project root:

```bash
flutter create --platforms=android,web --project-name week_06_tasbih_app .
flutter pub get
flutter analyze
flutter test
flutter run
```

Or run `bash setup.sh` on Linux/macOS or `./setup.ps1` in PowerShell. `flutter create` completes SDK-managed files without the need to copy an old project.

## Test manually

1. Tap to reach **33**: count=33, rounds=1. Next tap starts at 1 and total taps continues.
2. Tap Undo after a count and verify the number returns to its previous value.
3. Change from SubhanAllah to Alhamdulillah, add counts, switch back: counts remain independent.
4. Change target from 33 to 99 with a nonzero count: confirmation appears and starts a new round.
5. Reset a nonzero round, then tap **UNDO** on the snackbar: previous count returns.
6. Open **Progress** and confirm totals reflect your taps/rounds.
7. Restart the app: counters, targets and haptics preference should be restored.

## Submission notes

Submit the project source and your own simulator/device screenshots. Screenshot locations are described in `screenshots/README.md`. Do not treat the preview/mock layouts as runtime evidence.

## Verification limitations

This archive has been checked for file existence, relative import paths, and ZIP integrity. Flutter and Dart SDK are not installed in the authoring environment, so `flutter analyze`, `flutter test` and runtime execution **have not been run**. The included tests are intended for running locally.
