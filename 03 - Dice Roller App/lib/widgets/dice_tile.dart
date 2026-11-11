import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'die_face.dart';

class DiceTile extends StatelessWidget {
  const DiceTile({
    required this.label,
    required this.value,
    required this.onTap,
    required this.animation,
    required this.animate,
    required this.enabled,
    required this.dieSize,
    super.key,
  });

  final String label;
  final int value;
  final VoidCallback onTap;
  final Animation<double> animation;
  final bool animate;
  final bool enabled;
  final double dieSize;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      button: true,
      enabled: enabled,
      label: '$label die: $value. Tap to roll this die.',
      child: Material(
        color: colors.primary.withAlpha(14),
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: enabled ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DiceTokens.sm,
              vertical: DiceTokens.lg,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label.toUpperCase(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        letterSpacing: 1.8,
                        color: colors.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    final t = animate ? animation.value : 1.0;
                    final sway = animate
                        ? math.sin(t * math.pi * 7) * (1 - t) * .17
                        : 0.0;
                    final lift = animate
                        ? -13.0 * math.sin(t * math.pi)
                        : 0.0;
                    return Transform.translate(
                      offset: Offset(0, lift),
                      child: Transform.rotate(angle: sway, child: child),
                    );
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    transitionBuilder: (child, anim) => ScaleTransition(
                      scale: anim,
                      child: FadeTransition(opacity: anim, child: child),
                    ),
                    child: DieFace(
                      key: ValueKey(value),
                      value: value,
                      size: dieSize,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Tap to roll',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
