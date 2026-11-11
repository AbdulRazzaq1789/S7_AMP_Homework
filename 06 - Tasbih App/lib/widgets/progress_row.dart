import 'package:flutter/material.dart';

import '../models/dhikr.dart';
import '../models/tasbih_data.dart';
import '../theme/app_theme.dart';

class ProgressRow extends StatelessWidget {
  const ProgressRow({super.key, required this.dhikr, required this.progress, required this.onSelected});
  final Dhikr dhikr;
  final DhikrProgress progress;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
      side: const BorderSide(color: AppPalette.outline),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(dhikr.name, style: Theme.of(context).textTheme.titleMedium)),
                Text('${progress.count} / ${progress.goal}', style: const TextStyle(fontWeight: FontWeight.w800, color: AppPalette.pine)),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right_rounded, color: AppPalette.muted),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: progress.fraction,
                minHeight: 7,
                backgroundColor: AppPalette.mint,
                color: AppPalette.jade,
              ),
            ),
            const SizedBox(height: 12),
            Text('${progress.lifetimeTaps} total taps   •   ${progress.completedRounds} completed rounds',
              style: const TextStyle(color: AppPalette.muted, fontSize: 12)),
          ],
        ),
      ),
    ),
  );
}
