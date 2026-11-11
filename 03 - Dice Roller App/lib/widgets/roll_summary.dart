import 'package:flutter/material.dart';

import '../models/roll_record.dart';
import '../theme/app_theme.dart';

class RollSummary extends StatelessWidget {
  const RollSummary({
    required this.total,
    required this.lastRoll,
    super.key,
  });

  final int total;
  final RollRecord? lastRoll;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: dark ? scheme.primaryContainer : const Color(0xFFF0EDFF),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'COMBINED TOTAL',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w800,
                        color: scheme.onPrimaryContainer,
                      ),
                ),
                const SizedBox(height: DiceTokens.xs),
                Text(
                  lastRoll == null
                      ? 'Your first roll awaits'
                      : '${lastRoll!.actionLabel} • latest result',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onPrimaryContainer,
                      ),
                ),
                if (lastRoll?.isDouble == true) ...[
                  const SizedBox(height: 8),
                  const Text(
                    '✦ DOUBLES!',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppTheme.accentStrong,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: DiceTokens.sm),
          Text(
            '$total',
            key: const Key('total_value'),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: scheme.onPrimaryContainer,
                  height: 1,
                ),
          ),
        ],
      ),
    );
  }
}
