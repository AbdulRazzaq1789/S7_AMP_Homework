# Week 03 — Dice Roller App

**Course:** Advanced Mobile Programming (Flutter)  
**Project:** `week_03_dice_roller_app`  
**Purpose:** Independent Week 3 Flutter practical requested by the student.

> **Scope:** The uploaded Week 03 lecture's formal Homework Assignment was a
> standalone `student_management.dart` task. This *Dice Roller App* is the
> alternate project explicitly requested for Week 3; it is not a transcription
> of that lecture's homework slide.

## What the app does

- Draws two six-sided dice with **vector pips** (no image downloads or packages).
- **Roll both dice** using a random 1–6 outcome for each die.
- Tap either die to roll it alone, leaving the other die unchanged.
- Animates each rolling die and transitions to the final number.
- Shows the combined total, recent rolls, number of doubles, and highest total.
- Keeps the last ten rolls visible in a horizontal history strip.
- Clears session history after confirmation while preserving the current faces.
- Supports a light/dark theme toggle and small or wide screen sizes.
- Includes unit and widget tests.

## Folder layout

```text
lib/
  main.dart                         App entry point
  app.dart                          MaterialApp and theme switch
  controllers/dice_session_controller.dart   Randomization & statistics
  models/roll_record.dart           History model and roll targets
  screens/dice_roller_screen.dart   Main UI and animation controller
  theme/app_theme.dart              Theme and reusable design tokens
  widgets/die_face.dart             1–6 pip vector painter
  widgets/dice_tile.dart            Tappable animated dice
  widgets/roll_summary.dart         Current total & doubles label
  widgets/session_statistics.dart   Roll / double / best-total statistics
  widgets/roll_history.dart         Last ten results
test/                               Controller, painter, and widget tests
android/                            Android platform source/configuration
web/                                Web platform shell and icons
screenshots/                        Screenshot instructions
```

## Prerequisites

- Flutter SDK with **Dart 3.5+** (run `flutter doctor`).
- Android Studio + Android SDK for Android, or Chrome for web.
- Internet on first run may be needed for Flutter/Gradle dependencies; **the app itself works offline**.

## Quick start

From the extracted project folder:

```bash
# Linux / macOS
bash setup.sh

# Windows PowerShell (instead of the command above)
# .\setup.ps1

flutter analyze
flutter test
flutter run
```

`setup.sh` / `setup.ps1` runs `flutter create --platforms=android,web .`
to complete any Flutter-SDK-generated platform files (especially the Android
Gradle wrapper, `local.properties`, and Flutter build metadata), then runs
`flutter pub get`. The archive already includes the human-editable Flutter,
Android and Web source/configuration. It does **not** include generated build
artifacts or the Flutter SDK.

To run on Chrome:

```bash
flutter run -d chrome
```

## Suggested demonstration

1. Open the app and show both starting dice.
2. Press **Roll both dice**; show the total and history entry.
3. Tap the **LEFT** die, then the **RIGHT** die, individually.
4. Roll until you get doubles; note the badge and statistics.
5. Toggle light/dark mode.
6. Clear history and verify the counters reset.

### Screenshots

Capture at least (1) fresh screen, (2) several rolls with history, and
(3) dark-mode screen. The `screenshots/` folder contains capture instructions;
no screenshots are falsely presented as device captures.

## Technical notes

- `Random().nextInt(6) + 1` generates values from 1 through 6 inclusive.
- The dice model is tested independently of the animation and UI.
- `AnimationController` is explicitly disposed in the screen's `dispose()`.
- History lasts only for the current app session (it is not saved to disk).
- The native scaffold is included as editable source; SDK-specific generated
  files are finished on the user's computer by the setup script.
- The project was statically checked here, but Flutter compilation/tests could
  not be executed because the Flutter SDK is not installed in this environment.
