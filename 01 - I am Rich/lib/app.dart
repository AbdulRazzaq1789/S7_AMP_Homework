import 'package:flutter/material.dart';

import 'screens/i_am_rich_screen.dart';
import 'theme/app_theme.dart';

class IAmRichApp extends StatelessWidget {
  const IAmRichApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Am Rich',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: const IAmRichScreen(),
    );
  }
}
