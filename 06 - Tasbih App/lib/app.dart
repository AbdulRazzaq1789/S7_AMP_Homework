import 'package:flutter/material.dart';

import 'screens/tasbih_shell.dart';
import 'state/tasbih_controller.dart';
import 'theme/app_theme.dart';

class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key, required this.controller});

  final TasbihController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasbih • Daily Dhikr',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: TasbihShell(controller: controller),
    );
  }
}
