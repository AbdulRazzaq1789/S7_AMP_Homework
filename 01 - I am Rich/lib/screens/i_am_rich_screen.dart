import 'package:flutter/material.dart';

import '../theme/app_palette.dart';
import '../widgets/diamond_display.dart';
import '../widgets/rich_message.dart';

class IAmRichScreen extends StatelessWidget {
  const IAmRichScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('I Am Rich')),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.55),
            radius: 1.15,
            colors: [
              AppPalette.deepRuby,
              AppPalette.background,
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final diamondSize = (constraints.maxWidth * 0.78)
                  .clamp(180.0, 390.0)
                  .toDouble();

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 530),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DiamondDisplay(size: diamondSize),
                        const SizedBox(height: 8),
                        const RichMessage(),
                        const SizedBox(height: 32),
                        const SizedBox(
                          width: 72,
                          child: Divider(
                            color: AppPalette.gold,
                            thickness: 1.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'ADVANCED MOBILE PROGRAMMING  /  WEEK 01',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppPalette.muted,
                            fontSize: 10,
                            letterSpacing: 1.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
