# Week 05 — Homework Requirements (Lecture 5, PDF page 85)

| Lecturer's requirement | Implementation |
| --- | --- |
| Build a `Course Detail Screen` in Flutter | `lib/screens/course_detail_screen.dart` |
| Use `SafeArea` and `Scaffold` | `lib/screens/course_detail_screen.dart` |
| Header `Container` with course title and code | `lib/widgets/course_hero.dart` |
| `Text` and `RichText` with at least three styles | `lib/widgets/course_hero.dart` (`TextSpan`: label, code, accent); `lib/theme/app_theme.dart` |
| `Row` for credits, semester, instructor | `lib/widgets/course_overview_card.dart` (responsive Row and Column) |
| `Column` to organize sections | `lib/screens/course_detail_screen.dart` |
| Nested `Row` / `Column` contact-details card | `lib/widgets/instructor_contact_card.dart` |
| Padding, margin, alignment, borderRadius | `course_hero.dart`, `section_card.dart`, `course_detail_screen.dart` and overview widgets |
| Long description, prevent overflow | `lib/widgets/course_description_card.dart` and page `SingleChildScrollView` |
| Use `const` wherever applicable | Throughout all widgets |
| Submit source code and screenshots at two device sizes | Source provided; capture **real** screenshots from your emulator/device into `screenshots/` |

**Important:** The lecture slide does not request an API, database, login, or extra navigation screens. The homework is intentionally one well-built responsive screen organized across multiple files.
