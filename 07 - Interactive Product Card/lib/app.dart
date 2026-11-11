import 'package:flutter/material.dart';

import 'screens/gesture_lab_screen.dart';
import 'theme/app_theme.dart';

class GestureLabApp extends StatelessWidget {
  const GestureLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Lab | Interactive Product Card',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const GestureLabScreen(),
    );
  }
}
