# Lecture 02 — Homework Assignment checklist

| Lecture requirement | Implemented in |
|---|---|
| Create a Flutter `Student Profile` application | `lib/main.dart`, `lib/app.dart` |
| Show student name, department, semester, short biography | `lib/data/sample_student.dart`, `widgets/profile_header.dart`, `widgets/biography_card.dart` |
| Use `MaterialApp`, `Scaffold`, and `AppBar` | `lib/app.dart`, `screens/student_profile_screen.dart` |
| Global `ThemeData` | `lib/theme/app_theme.dart` |
| At least one local theme override | `widgets/local_theme_card.dart` (`Theme(data: ...)`) |
| StatelessWidget and StatefulWidget | `widgets/profile_header.dart` and `widgets/biography_card.dart` plus others |
| Interaction that changes state | Save profile, Read more, Join circle, toggle theme, Hot Reload counter |
| One appropriate external package | `intl: ^0.20.2` used for enrollment date in `widgets/student_information_card.dart` |
| Demonstrate Hot Reload and explain state behavior | `widgets/hot_reload_demo_card.dart` and `docs/HOT_RELOAD_GUIDE.md` |
| Source, screenshots, pubspec.yaml, Widget Tree diagram | Source and `pubspec.yaml` included, diagram in `docs/WIDGET_TREE.md`; screenshots require running the app |

**Note:** The sample profile is fictional and should be edited for the actual student's submission. Screenshots and Hot Reload observation must be captured after locally running the app.
