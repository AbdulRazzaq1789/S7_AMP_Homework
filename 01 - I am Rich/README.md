# Week 01 — I Am Rich App

An independent, beginner-friendly Flutter project for Advanced Mobile Programming. A blue faceted diamond sits on a deep wine background, with the classic **I AM RICH** message. The image is bundled locally so the app does not need internet access or third-party packages.

## Requirements

- Flutter SDK (Dart comes with Flutter)
- Android emulator/device or Chrome for web

## Run

From this folder, first verify your SDK, then run the included setup script **once**:

```bash
flutter doctor
bash setup.sh            # Linux / macOS
flutter run
```

On Windows PowerShell, use `./setup.ps1` instead of `bash setup.sh`. The archive includes editable Android/Web files but intentionally omits SDK-generated Gradle wrapper binaries and local SDK paths. The script completes those files using `flutter create --platforms=android,web --project-name week_01_i_am_rich_app .`, then runs `flutter pub get`. Your `lib/` and assets remain yours.

## Verify

```bash
flutter analyze
flutter test
```

## Project map

```text
lib/
  main.dart                entry point
  app.dart                 MaterialApp and theme wiring
  screens/
    i_am_rich_screen.dart  full-screen composition
  widgets/
    diamond_display.dart   image asset presentation
    rich_message.dart      text composition
  theme/
    app_palette.dart       color tokens
    app_theme.dart         global ThemeData
assets/images/diamond.png
android/                    Android embedding / Gradle scaffolding
web/                        Web app scaffolding + icons
test/widget_test.dart
docs/WIDGET_TREE.md
screenshots/README.md
```

## What it demonstrates

- `main()` / `runApp()` entry point
- `MaterialApp` + `Scaffold` + `AppBar`
- `StatelessWidget` and widget composition
- Bundled images and `pubspec.yaml` asset registration
- ThemeData and layout widgets (`SafeArea`, `Column`, `Center`)
- Responsive sizing without fixed device dimensions

## Submission notes

This is the **I Am Rich App** requested for Week 1, not the original lecture's Flutter setup and lifecycle homework. Include screenshots from your own emulator/phone if your instructor requests them. An editable widget tree is in `docs/WIDGET_TREE.md`.

**Verification scope:** This project was statically inspected (Dart local imports, asset paths, native configuration, image files, ZIP contents). Flutter was not installed in the preparation environment, so compile and runtime tests still need to be run locally.
