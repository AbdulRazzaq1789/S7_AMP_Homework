import 'package:flutter/material.dart';

import 'screens/xylophone_screen.dart';
import 'services/note_audio.dart';
import 'theme/app_theme.dart';

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key, this.audio});

  /// Inject a fake audio service in widget tests.
  final NoteAudio? audio;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone · Week 04',
      theme: AppTheme.dark,
      home: XylophoneScreen(audio: audio),
    );
  }
}
