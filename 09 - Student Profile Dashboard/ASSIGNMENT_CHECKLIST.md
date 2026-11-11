# Lecture 09 Homework — Requirements mapped to code

| Slide requirement | Implementation |
| --- | --- |
| Student Profile Dashboard | `lib/screens/student_dashboard_screen.dart` |
| Define application ColorScheme | `lib/theme/app_theme.dart`, via `ColorScheme.fromSeed` and theme overrides |
| Register and use a custom font family | Manrope loaded/registered by `google_fonts` through `AppTheme` (runtime registration, not local `pubspec.yaml` font registration) |
| Gradient profile header | `lib/widgets/profile_hero.dart` (`LinearGradient`) |
| Circular profile image | `lib/widgets/profile_avatar.dart` + `assets/images/student_avatar.png` |
| At least three Cards | `lib/widgets/metric_card.dart` (3 instances), plus 2 additional cards |
| Stack + Positioned status badge | `lib/widgets/profile_hero.dart` (Active badge on avatar) |
| Theme typography for headings/body | `lib/theme/app_theme.dart` and themed text in every screen |
| Light and dark themes | `lib/theme/app_theme.dart` + toggle in `lib/app.dart` |
| Styled details screen with Week 8 navigation | `Navigator.push` + `MaterialPageRoute` in dashboard, details screen |
| Submit source code and light/dark screenshots | All sources bundled; screenshot capture instructions in `README.md` |
