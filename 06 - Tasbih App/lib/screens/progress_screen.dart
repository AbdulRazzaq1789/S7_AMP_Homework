import 'package:flutter/material.dart';

import '../models/dhikr.dart';
import '../models/tasbih_data.dart';
import '../theme/app_theme.dart';
import '../widgets/progress_row.dart';
import '../widgets/section_heading.dart';
import '../widgets/stat_tile.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key, required this.data, required this.onSelectPhrase});
  final TasbihData data;
  final ValueChanged<String> onSelectPhrase;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 650),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 36),
          children: [
            Text('Your progress', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            const Text('A simple record of your repetitions. No streak pressure—just steady practice.',
              style: TextStyle(color: AppPalette.muted, height: 1.4)),
            const SizedBox(height: 22),
            Row(children: [
              Expanded(child: StatTile(icon: Icons.touch_app_outlined, label: 'Total taps', value: '${data.totalTaps}')),
              const SizedBox(width: 12),
              Expanded(child: StatTile(icon: Icons.verified_outlined, label: 'Completed rounds', value: '${data.totalRounds}')),
            ]),
            const SizedBox(height: 30),
            const SectionHeading(title: 'By dhikr', subtitle: 'Tap a card to continue that phrase.'),
            const SizedBox(height: 14),
            for (final dhikr in DhikrCatalog.items)
              ProgressRow(
                dhikr: dhikr,
                progress: data.forDhikr(dhikr.id),
                onSelected: () => onSelectPhrase(dhikr.id),
              ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppPalette.mint, borderRadius: BorderRadius.circular(18)),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline_rounded, color: AppPalette.pine),
                  SizedBox(width: 12),
                  Expanded(child: Text('Resetting a round clears only its current count. Lifetime taps and completed rounds stay recorded.',
                    style: TextStyle(color: AppPalette.deepPine, height: 1.4, fontSize: 13))),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
