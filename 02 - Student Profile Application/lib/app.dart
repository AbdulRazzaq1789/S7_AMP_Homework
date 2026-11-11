import 'package:flutter/material.dart';

import 'data/sample_student.dart';
import 'models/student.dart';
import 'screens/student_profile_screen.dart';
import 'theme/app_theme.dart';

/// StatefulWidget: owns the application-level theme selection.
class StudentProfileApp extends StatefulWidget {
  const StudentProfileApp({super.key, this.student});

  final Student? student;

  @override
  State<StudentProfileApp> createState() => _StudentProfileAppState();
}

class _StudentProfileAppState extends State<StudentProfileApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: StudentProfileScreen(
        student: widget.student ?? sampleStudent,
        isDark: _themeMode == ThemeMode.dark,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
