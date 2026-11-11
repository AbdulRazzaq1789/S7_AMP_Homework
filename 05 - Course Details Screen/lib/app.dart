import 'package:flutter/material.dart';

import 'screens/course_detail_screen.dart';
import 'theme/app_theme.dart';

class CourseDetailApp extends StatelessWidget {
  const CourseDetailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Detail',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const CourseDetailScreen(),
    );
  }
}
