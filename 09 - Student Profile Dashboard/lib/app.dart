import 'package:flutter/material.dart';

import 'data/sample_student.dart';
import 'screens/student_dashboard_screen.dart';
import 'theme/app_theme.dart';

/// Owns the global theme mode; the screens only request a theme change.
class StudentDashboardApp extends StatefulWidget {
  /// The production app uses the Manrope font through google_fonts.
  /// Tests can disable asynchronous font loading with [useCustomFont].
  const StudentDashboardApp({super.key, this.useCustomFont = true});

  final bool useCustomFont;

  @override
  State<StudentDashboardApp> createState() => _StudentDashboardAppState();
}

class _StudentDashboardAppState extends State<StudentDashboardApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(useCustomFont: widget.useCustomFont),
      darkTheme: AppTheme.dark(useCustomFont: widget.useCustomFont),
      themeMode: _themeMode,
      home: StudentDashboardScreen(
        student: sampleStudent,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
