import 'package:flutter/material.dart';

import '../models/roll_record.dart';
import '../theme/app_theme.dart';

class RollHistory extends StatelessWidget {
  const RollHistory({required this.rolls, super.key});

  final List<RollRecord> rolls;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(DiceTokens.lg),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(DiceTokens.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.history_rounded, size: 21),
              const SizedBox(width: 10),
              Text(
                'RECENT ROLLS',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
              ),
            ],
          ),
          const SizedBox(height: DiceTokens.md),
          if (rolls.isEmpty)
            Text(
              'No rolls yet. Give the dice a try!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
            )
          else
            SizedBox(
              height: 86,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: rolls.length > 10 ? 10 : rolls.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: DiceTokens.sm),
                itemBuilder: (context, index) {
                  final roll = rolls[index];
                  return Container(
                    width: 95,
                    padding: const EdgeInsets.all(DiceTokens.sm),
                    decoration: BoxDecoration(
                      color: scheme.primary.withAlpha(18),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${roll.left} + ${roll.right}',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Total ${roll.total}',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                        ),
                        if (roll.isDouble)
                          Text(
                            'DOUBLE',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w800,
                                  color: scheme.primary,
                                ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
