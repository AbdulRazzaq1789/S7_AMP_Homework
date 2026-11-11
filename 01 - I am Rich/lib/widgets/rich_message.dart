import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// Introductory Flutter widget composition: Column + Text + SizedBox.
class RichMessage extends StatelessWidget {
  const RichMessage({super});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'A FLUTTER CLASSIC',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppPalette.gold,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 3.0,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'I AM RICH',
          key: Key('rich-title'),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 37,
            color: AppPalette.pearl,
            fontWeight: FontWeight.w800,
            letterSpacing: 3.5,
            height: 1.08,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Confidence is priceless.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppPalette.muted,
            height: 1.55,
          ),
        ),
      ],
    );
  }
}
