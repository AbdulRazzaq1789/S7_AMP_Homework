# Week 05 — Course Detail Screen

A complete, independent Flutter homework project for **Advanced Mobile Programming — Lecture 5 (Using Common Widgets, Part I)**.

## Application

The course detail page has a modern header, course metadata, a multi-paragraph course description, an instructor/contact card, and a learning-outcomes/outline section. The two buttons are functional: **Save course** toggles a local saved state, and **View outline** scrolls to the outline. These controls are extra polish rather than assignment requirements. The interface adapts from a one-column phone view to a two-column layout on wider screens.

**Demo content disclaimer:** The course title, code, department, and instructor name are taken from the supplied slides; the semester, credit value, example contact information, and course outline are illustrative UI data, **not verified institutional records**. Replace `lib/data/sample_course.dart` as needed.

## How to run

1. Install Flutter, Android Studio or VS Code with Flutter, and an emulator or a device.
2. Open this project directory.
3. Run `bash setup.sh` (macOS/Linux) or `./setup.ps1` (Windows PowerShell). This runs `flutter create --platforms=android,web .` to complete/version-match SDK-generated native files without replacing the Dart application.
4. Run `flutter analyze`, `flutter test`, and `flutter run`.

For iOS on macOS, you can additionally run `flutter create --platforms=ios .`.

`flutter pub get` alone is not a substitute for the generated platform files when Flutter has not initialized a project on the local machine. The Android/Web folder structures are already included for inspection and will be completed by setup.

## Source layout

```text
lib/
  main.dart                         Entry point
  app.dart                          MaterialApp configuration
  models/course.dart                Immutable course presentation model
  data/sample_course.dart           Demo course information
  theme/app_theme.dart              Shared UI colors and styles
  screens/course_detail_screen.dart Responsive, scrollable page
  widgets/course_hero.dart          Header Container, Text and RichText
  widgets/course_overview_card.dart Row with credits/semester/instructor
  widgets/instructor_contact_card.dart Nested Row/Column contact card
  widgets/course_description_card.dart Long description that wraps
  widgets/course_outline_card.dart  Learning outcomes and topic chips
  widgets/section_card.dart         Reusable section container
```

## Assignment evidence and screenshots

Lecture 5 specifically asks for **source code and screenshots from at least two device/emulator sizes**. The `screenshots/` folder contains a checklist but no fabricated emulator screenshots. Capture one phone screenshot (for example 360×800) and another on a larger phone/tablet (for example 800×1280); include the course header and the remainder of the page via a second screenshot as necessary.

`ASSIGNMENT_CHECKLIST.md` maps every original homework bullet to the source file that implements it.

## Testing status

The ZIP, local imports, assets, and project configuration can be checked statically in the authoring environment. Flutter is not installed there, so **no claim is made that this app passed Flutter compilation or on-device tests**. Run the commands above locally to verify and capture the actual screenshots.
