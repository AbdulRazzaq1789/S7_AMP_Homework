# Week 09 — Student Profile Dashboard

A standalone, modern Flutter homework project for **Advanced Mobile Programming, Lecture 09: Styling Your Widgets**.

## What it includes

- Responsive dashboard with a gradient profile header and circular *local asset* portrait.
- A **Stack + Positioned** "Active" status badge attached to the portrait.
- **At least three Flutter Card widgets**: GPA, earned credits, semester, plus semester progress and class schedule cards.
- Centralized `ColorScheme`, theme typography, Material 3, and **light/dark theme toggle**.
- **Manrope custom font** loaded through the `google_fonts` package, shared by both themes.
- A separate, styled **Student Details** route opened with `Navigator.push` / `MaterialPageRoute`.
- Fictional sample student data. No login, API keys, server or database required.
- Widget tests for theme switching/navigation and a test for academic progress calculations.

## Quick start

Requires a recent Flutter SDK (Flutter 3.27 or later recommended), Android Studio/emulator or Chrome, and an internet connection for dependency download and first-time font fetching.

```bash
cd Week_09_Student_Profile_Dashboard
flutter pub get
flutter analyze
flutter test
flutter run -d chrome       # or flutter run -d <your-device-id>
```

This archive includes native Android and Web source scaffolding. If the locally installed Flutter version requires additional generated platform files or Android Gradle wrapper files, run this once **inside the project directory** and then retry:

```bash
flutter create --platforms=android,web --project-name week_09_student_profile_dashboard .
flutter pub get
```

`flutter create .` fills in SDK-specific generated files; it does not replace the hand-written `lib/` sources or local portrait asset.

## File organization

```text
lib/
  main.dart                       App entry point
  app.dart                        MaterialApp and live theme switching
  models/course.dart              Immutable course model
  models/student_profile.dart     Immutable student model + progress
  data/sample_student.dart        Fictional offline student data
  theme/app_theme.dart            ColorScheme + Manrope typography
  screens/student_dashboard_screen.dart
  screens/student_details_screen.dart
  widgets/
    profile_hero.dart             Gradient + Stack/Positioned badge
    profile_avatar.dart           Circular local asset image + Hero
    metric_card.dart              Three academic Cards
    semester_progress_card.dart   Progress card
    course_preview_card.dart      Class schedule card
    info_row.dart                 Shared detail field
    section_title.dart            Shared typography pattern
assets/images/student_avatar.png
android/                          Android scaffold
web/                              Browser scaffold + icons
test/                             Model and widget tests
```

## Screenshots to submit

Your lecture's homework requests **source code and light/dark screenshots**. To collect both, launch the app, take one screenshot in the default light theme, then tap the moon icon in the AppBar to switch to dark mode and take a second screenshot. Optionally include a screenshot of the detail screen to demonstrate navigation.

## Fonts note

`google_fonts` registers and applies **Manrope** to theme typography. Its first use may download the font; it caches afterwards. The archive deliberately does not redistribute third-party font binaries. If your lecturer specifically requires *local font asset registration in `pubspec.yaml`*, add a font file you have permission to distribute under `assets/fonts/` and declare it in the `fonts:` section; then update `AppTheme` to use that family. The project already uses a non-system family in both themes through the package.

## Verification

Source structure, relative import paths, YAML files, assets and ZIP integrity have been checked. **Flutter SDK is not available in the packaging environment**, so actual `flutter analyze`, `flutter test`, Android and browser builds must be executed on your machine.
