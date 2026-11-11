import 'package:flutter/material.dart';

import '../controllers/dice_session_controller.dart';
import '../theme/app_theme.dart';

class SessionStatistics extends StatelessWidget {
  const SessionStatistics({required this.session, super.key});

  final DiceSessionController session;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final available = constraints.maxWidth;
        final cardWidth = available >= 560
            ? (available - 24) / 3
            : (available - 12) / 2;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _Stat(
              width: cardWidth,
              label: 'ROLLS',
              value: '${session.rollCount}',
              valueKey: const Key('stat_roll_count'),
              icon: Icons.casino_outlined,
            ),
            _Stat(
              width: cardWidth,
              label: 'DOUBLES',
              value: '${session.doublesCount}',
              icon: Icons.auto_awesome_outlined,
            ),
            _Stat(
              width: cardWidth,
              label: 'BEST TOTAL',
              value: session.bestTotal == 0 ? '—' : '${session.bestTotal}',
              icon: Icons.emoji_events_outlined,
            ),
          ],
        );
      },
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.width,
    required this.label,
    required this.value,
    required this.icon,
    this.valueKey,
  });

  final double width;
  final String label;
  final String value;
  final IconData icon;
  final Key? valueKey;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: width,
      padding: const EdgeInsets.all(DiceTokens.md),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.outlineVariant.withAlpha(115)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 21, color: scheme.primary),
          const SizedBox(height: 14),
          Text(
            value,
            key: valueKey,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: DiceTokens.xs),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.3,
                  color: scheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
