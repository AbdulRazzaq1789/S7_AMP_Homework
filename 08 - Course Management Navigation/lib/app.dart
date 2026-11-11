import 'package:flutter/material.dart';

import 'navigation/app_routes.dart';
import 'screens/about_screen.dart';
import 'screens/login_screen.dart';
import 'screens/workspace_screen.dart';
import 'state/course_store.dart';
import 'theme/app_theme.dart';

class CourseManagementApp extends StatefulWidget {
  const CourseManagementApp({super.key});

  @override
  State<CourseManagementApp> createState() => _CourseManagementAppState();
}

class _CourseManagementAppState extends State<CourseManagementApp> {
  late final CourseStore _courseStore = CourseStore();
  bool _darkMode = false;

  @override
  void dispose() {
    _courseStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Management',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.workspace: (context) => WorkspaceScreen(
              store: _courseStore,
              darkMode: _darkMode,
              onDarkModeChanged: (value) => setState(() => _darkMode = value),
            ),
        AppRoutes.about: (context) => const AboutScreen(),
      },
    );
  }
}
