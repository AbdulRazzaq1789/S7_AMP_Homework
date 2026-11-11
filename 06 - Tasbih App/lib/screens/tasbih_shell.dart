import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../state/tasbih_controller.dart';
import '../theme/app_theme.dart';
import 'counter_screen.dart';
import 'progress_screen.dart';

class TasbihShell extends StatefulWidget {
  const TasbihShell({super.key, required this.controller});
  final TasbihController controller;

  @override
  State<TasbihShell> createState() => _TasbihShellState();
}

class _TasbihShellState extends State<TasbihShell> {
  int selectedPage = 0;
  TasbihController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _increment() {
    if (controller.data.hapticsEnabled) HapticFeedback.selectionClick();
    final completed = controller.increment();
    if (completed && mounted) {
      if (controller.data.hapticsEnabled) HapticFeedback.mediumImpact();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Goal reached! ${controller.data.current.goal} repetitions completed.'),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  void _undo() {
    if (controller.undo()) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Last action undone.'), duration: Duration(seconds: 1)),
      );
    }
  }

  Future<void> _resetRound() async {
    if (controller.data.current.count == 0) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reset this round?'),
        content: const Text('The current count will return to zero. Your lifetime taps and completed rounds will stay saved.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: const Text('Reset round')),
        ],
      ),
    );
    if (!mounted || confirmed != true) return;
    controller.resetRound();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Round reset.'),
      action: SnackBarAction(label: 'UNDO', onPressed: _undo),
      duration: const Duration(seconds: 5),
    ));
  }

  Future<void> _changeGoal(int goal) async {
    final progress = controller.data.current;
    if (goal == progress.goal) return;
    if (progress.count > 0) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Change target?'),
          content: Text('Changing the target to $goal will start a new round for this dhikr. Your completed rounds and lifetime taps will be kept.'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: const Text('Change target')),
          ],
        ),
      );
      if (!mounted || confirmed != true) return;
    }
    controller.setGoal(goal);
  }

  void _showSettings() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => AnimatedBuilder(
        animation: controller,
        builder: (context, _) => SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Preferences', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Haptic feedback'),
                  subtitle: const Text('Vibrate lightly whenever you tap the counter.'),
                  secondary: const Icon(Icons.vibration_rounded, color: AppPalette.pine),
                  value: controller.data.hapticsEnabled,
                  onChanged: controller.setHapticsEnabled,
                ),
                const SizedBox(height: 10),
                const Text('Your counters and settings are saved locally on this device. No account or internet connection is required after dependencies are installed.',
                  style: TextStyle(color: AppPalette.muted, height: 1.45)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: controller,
    builder: (context, _) => Scaffold(
      appBar: AppBar(
        titleSpacing: 22,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.spa_rounded, color: AppPalette.pine, size: 25),
            SizedBox(width: 10),
            Text('TASBIH', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, letterSpacing: 2.6)),
          ],
        ),
        actions: [
          IconButton(
            key: const Key('settings_button'),
            tooltip: 'Preferences',
            onPressed: controller.isReady ? _showSettings : null,
            icon: const Icon(Icons.tune_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: controller.isReady
        ? IndexedStack(
            index: selectedPage,
            children: [
              CounterScreen(
                controller: controller,
                onCount: _increment,
                onUndo: _undo,
                onReset: _resetRound,
                onGoalChanged: _changeGoal,
              ),
              ProgressScreen(
                data: controller.data,
                onSelectPhrase: (id) {
                  controller.selectDhikr(id);
                  setState(() => selectedPage = 0);
                },
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: selectedPage,
        onDestinationSelected: (next) => setState(() => selectedPage = next),
        destinations: const [
          NavigationDestination(key: Key('nav_counter'), icon: Icon(Icons.touch_app_outlined), selectedIcon: Icon(Icons.touch_app_rounded), label: 'Counter'),
          NavigationDestination(key: Key('nav_progress'), icon: Icon(Icons.insights_outlined), selectedIcon: Icon(Icons.insights_rounded), label: 'Progress'),
        ],
      ),
    ),
  );
}
