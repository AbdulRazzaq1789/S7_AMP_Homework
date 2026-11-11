# Week 03 — Dice Roller App: implementation checklist

This project follows the user's separately requested **Dice Roller** title.
The actual Week 3 slide asks for `student_management.dart` instead; that
Dart program is intentionally not included in this Flutter app project.

| Feature | Implementation |
|---|---|
| Two six-sided dice | `lib/widgets/die_face.dart`, `dice_tile.dart` |
| Random dice numbers 1–6 | `lib/controllers/dice_session_controller.dart` |
| Roll both dice | `lib/screens/dice_roller_screen.dart` |
| Roll one die at a time | `DiceTarget.left` / `.right` |
| Animated rolling | `AnimationController` + `AnimatedBuilder` |
| Accurate pips for 1–6 | `DiePipsPainter.positionsFor()` |
| Sum of both dice | `lib/widgets/roll_summary.dart` |
| Roll history / doubles / best score | `roll_history.dart`, `session_statistics.dart` |
| Light and dark themes | `lib/app.dart`, `lib/theme/app_theme.dart` |
| Modular Flutter project | `lib/{controllers,models,screens,theme,widgets}` |
| Android and Web source files | `android/`, `web/` |
| Test coverage | `test/*.dart` |

**Deliverables:** This archive includes the complete editable source project,
README, tests, native shell source, and instructions. Real screenshots and
Flutter-run test results must be captured on a device with Flutter installed.
