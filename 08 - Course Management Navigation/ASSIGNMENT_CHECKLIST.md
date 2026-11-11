# Week 08 — Homework checklist

From **Advanced Mobile Programming · Lecture 08 · Homework Assignment (slide/PDF page 67)**:

| Requirement | Where implemented |
|---|---|
| Course Management Navigation Demo | Entire project |
| Home, Courses, Course Details, Profile, Settings | `screens/`, `screens/sections/` |
| Drawer for Home/Profile/Settings | `widgets/workspace_drawer.dart` and `screens/workspace_screen.dart` |
| Three tabs within Courses | `screens/sections/courses_section.dart` (`TabBar` + `TabBarView`) |
| Push Course Details from a course item | `screens/workspace_screen.dart` (`Navigator.push` + `MaterialPageRoute`) |
| Pass title, code, credits | `models/course.dart`, `screens/course_details_screen.dart` |
| Return favorite/updated result | `models/course_update.dart` + `Navigator.pop(result)` + `CourseStore.applyUpdate` |
| Named route for a destination | `'/about'` via `navigation/app_routes.dart`, `app.dart` and `settings_section.dart` |
| pushReplacement or stack clearing in simulated login | `login_screen.dart` (`pushReplacementNamed`), `settings_section.dart` (`pushNamedAndRemoveUntil`) |
| Submit source code | Complete `lib/` and project structure inside ZIP |
| Submit route diagram | `docs/ROUTE_DIAGRAM.md`, `docs/route_diagram.svg`, `docs/route_diagram.png` |
| Submit screenshots | **Capture from a running local Flutter instance**; suggested list in README |

**Note:** Screenshots must show an actual running app and are not fabricated. Flutter SDK is unavailable in this packaging environment.
