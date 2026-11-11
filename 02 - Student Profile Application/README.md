# Week 02 — Student Profile Application

**Course:** Advanced Mobile Programming · Lecture 02  
**Assignment:** Create a Student Profile Flutter application.

A self-contained, responsive Material 3 example demonstrating Flutter's project structure, stateful/stateless widgets, global/local themes, a third-party package, and Hot Reload. Uses fictional student data.

## Requirements and tools

- Flutter SDK with Dart >= 3.5
- Android Studio/VS Code with Flutter extension, or Flutter Web
- Internet for the one-time `flutter pub get` package fetch (`intl`), unless already cached

## Project structure

```text
Week_02_Student_Profile_Application/
├── lib/
│   ├── main.dart                  # Entry point / runApp()
│   ├── app.dart                   # MaterialApp + global theme toggle
│   ├── data/sample_student.dart   # Fictional sample profile
│   ├── models/student.dart        # Immutable student model
│   ├── screens/student_profile_screen.dart
│   ├── theme/app_palette.dart
│   ├── theme/app_theme.dart
│   └── widgets/                   # Reusable presentation and state examples
├── assets/images/student_avatar.png
├── android/                       # Android platform source scaffold
├── web/                           # Web platform source scaffold
├── test/                          # Widget and model tests
├── docs/HOT_RELOAD_GUIDE.md
├── docs/WIDGET_TREE.md
├── screenshots/README.md
├── pubspec.yaml
├── ASSIGNMENT_CHECKLIST.md
├── setup.sh                        # macOS / Linux
└── setup.ps1                       # Windows PowerShell
```

## First run

Extract the ZIP, open its project directory in the terminal, and run:

```bash
# macOS / Linux
bash setup.sh

# Or Windows PowerShell
.\setup.ps1

flutter analyze
flutter test
flutter run
```

The setup script executes `flutter create --platforms=android,web .` to complete version/SDK-specific Gradle files and local Flutter-generated metadata, while preserving all files in `lib/`, `assets/`, and `test/`.

**For iOS (macOS with Xcode):** `flutter create --platforms=ios .` then `flutter run -d ios`.

## Where to customize for submission

- Edit `lib/data/sample_student.dart` to replace the **fictional** profile with your own name, department, semester, biography, and other fields.
- Replace the generated avatar at `assets/images/student_avatar.png` if desired.
- Set the global color system in `lib/theme/app_theme.dart` and `lib/theme/app_palette.dart`.
- The green **Study circle** card is the required **local theme override**; it intentionally keeps a different accent from the app theme.

## State demonstrations

- **Save profile:** a `StatefulWidget` updates the save button text and icon.
- **About me:** expands/collapses biography via `setState`.
- **Study circle:** stateful join/leave button inside a nested `Theme`.
- **Theme toggle:** global `ThemeMode` changes between Material light and dark.
- **Hot Reload lab:** count-up state can be preserved while you edit Dart text and Hot Reload. See `docs/HOT_RELOAD_GUIDE.md`.

The external package **`intl`** is used by the Student Information card to format the enrollment date (e.g., `September 2023`).

## Homework submission

Submit the source project, `pubspec.yaml`, a screenshot of the profile, the included short Widget Tree diagram, and an actual Hot Reload before/after demonstration. Use `screenshots/README.md` to capture evidence on your own emulator/device.

## Verification limitations

The project was statically checked for import paths, platform metadata, asset paths, and ZIP integrity in the generation environment. The Flutter SDK is **not installed** in that environment, so `flutter pub get`, `flutter analyze`, `flutter test` and emulator runtime behavior must be verified on your machine.
