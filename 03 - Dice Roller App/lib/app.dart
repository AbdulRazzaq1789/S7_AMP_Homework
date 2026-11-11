import 'package:flutter/material.dart';

import 'screens/dice_roller_screen.dart';
import 'theme/app_theme.dart';

class DiceRollerApp extends StatefulWidget {
  const DiceRollerApp({super.key});

  @override
  State<DiceRollerApp> createState() => _DiceRollerAppState();
}

class _DiceRollerAppState extends State<DiceRollerApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: DiceRollerScreen(
        isDark: _themeMode == ThemeMode.dark,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
