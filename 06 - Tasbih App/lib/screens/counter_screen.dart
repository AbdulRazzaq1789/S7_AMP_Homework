import 'package:flutter/material.dart';

import '../state/tasbih_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/counter_dial.dart';
import '../widgets/dhikr_selector.dart';
import '../widgets/goal_selector.dart';
import '../widgets/section_heading.dart';
import '../widgets/stat_tile.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    super.key,
    required this.controller,
    required this.onCount,
    required this.onUndo,
    required this.onReset,
    required this.onGoalChanged,
  });

  final TasbihController controller;
  final VoidCallback onCount;
  final VoidCallback onUndo;
  final VoidCallback onReset;
  final ValueChanged<int> onGoalChanged;

  @override
  Widget build(BuildContext context) {
    final data = controller.data;
    final progress = data.current;
    return SafeArea(
      top: false,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 38),
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(23, 25, 23, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppPalette.pine, AppPalette.deepPine],
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('A QUIET MOMENT FOR YOU', style: TextStyle(color: AppPalette.gold, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1.6)),
                    SizedBox(height: 8),
                    Text('Every remembrance counts.', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800, height: 1.18)),
                    SizedBox(height: 8),
                    Text('Choose your dhikr and tap at your own pace.', style: TextStyle(color: Color(0xFFD3E8E1), fontSize: 13)),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              const SectionHeading(title: 'Choose a dhikr', subtitle: 'Each phrase keeps its own count and target.'),
              const SizedBox(height: 12),
              DhikrSelector(selectedId: data.activeDhikrId, onChanged: controller.selectDhikr),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.fromLTRB(14, 22, 14, 23),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: AppPalette.outline),
                ),
                child: Column(
                  children: [
                    Text(data.activeDhikr.arabic,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w700, color: AppPalette.pine)),
                    const SizedBox(height: 5),
                    Text(data.activeDhikr.meaning,
                      style: const TextStyle(fontSize: 12, color: AppPalette.muted)),
                    const SizedBox(height: 20),
                    CounterDial(
                      count: progress.count,
                      goal: progress.goal,
                      phrase: data.activeDhikr.name,
                      onTap: onCount,
                    ),
                    const SizedBox(height: 16),
                    Text(progress.isComplete
                      ? 'Beautiful work. Tap again to begin a new round.'
                      : '${progress.goal - progress.count} more to reach your target',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppPalette.muted, fontSize: 12)),
                    const SizedBox(height: 17),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        OutlinedButton.icon(
                          key: const Key('undo_button'),
                          onPressed: controller.canUndo ? onUndo : null,
                          icon: const Icon(Icons.undo_rounded, size: 18),
                          label: const Text('Undo'),
                        ),
                        OutlinedButton.icon(
                          key: const Key('reset_button'),
                          onPressed: progress.count > 0 ? onReset : null,
                          icon: const Icon(Icons.restart_alt_rounded, size: 18),
                          label: const Text('Reset round'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 27),
              const SectionHeading(title: 'Repetition target', subtitle: 'Changing targets restarts only the active round.'),
              const SizedBox(height: 11),
              GoalSelector(selectedGoal: progress.goal, onChanged: onGoalChanged),
              const SizedBox(height: 25),
              const SectionHeading(title: 'Your practice', subtitle: 'Saved automatically on this device.'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: StatTile(icon: Icons.touch_app_outlined, label: 'Lifetime taps', value: '${data.totalTaps}')),
                  const SizedBox(width: 12),
                  Expanded(child: StatTile(icon: Icons.verified_outlined, label: 'Completed rounds', value: '${data.totalRounds}')),
                ],
              ),
              if (controller.storageError != null) ...[
                const SizedBox(height: 12),
                Text(controller.storageError!, style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w600)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
