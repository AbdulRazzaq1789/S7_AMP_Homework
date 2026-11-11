import 'package:flutter/material.dart';

import '../controllers/dice_session_controller.dart';
import '../models/roll_record.dart';
import '../theme/app_theme.dart';
import '../widgets/dice_tile.dart';
import '../widgets/roll_history.dart';
import '../widgets/roll_summary.dart';
import '../widgets/session_statistics.dart';

class DiceRollerScreen extends StatefulWidget {
  const DiceRollerScreen({
    required this.isDark,
    required this.onToggleTheme,
    super.key,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  State<DiceRollerScreen> createState() => _DiceRollerScreenState();
}

class _DiceRollerScreenState extends State<DiceRollerScreen>
    with SingleTickerProviderStateMixin {
  late final DiceSessionController _session;
  late final AnimationController _rollAnimation;
  bool _rolling = false;
  DiceTarget? _activeTarget;

  @override
  void initState() {
    super.initState();
    _session = DiceSessionController();
    _rollAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
  }

  Future<void> _roll(DiceTarget target) async {
    if (_rolling) return;
    setState(() {
      _rolling = true;
      _activeTarget = target;
    });
    try {
      await _rollAnimation.forward(from: 0);
      if (!mounted) return;
      _session.roll(target);
    } finally {
      if (mounted) {
        setState(() {
          _rolling = false;
          _activeTarget = null;
        });
      }
    }
  }

  @override
  void dispose() {
    _rollAnimation.dispose();
    _session.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: DiceTokens.md,
            vertical: DiceTokens.lg,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 740),
              child: AnimatedBuilder(
                animation: _session,
                builder: (context, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _topBar(scheme),
                    const SizedBox(height: DiceTokens.xl),
                    _hero(),
                    const SizedBox(height: DiceTokens.lg),
                    _diceArena(),
                    const SizedBox(height: DiceTokens.lg),
                    SessionStatistics(session: _session),
                    const SizedBox(height: DiceTokens.lg),
                    RollHistory(rolls: _session.history),
                    const SizedBox(height: DiceTokens.xl),
                    Center(
                      child: Text(
                        'WEEK 03  ·  ADVANCED MOBILE PROGRAMMING',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              letterSpacing: 1.4,
                              color: scheme.onSurfaceVariant,
                            ),
                      ),
                    ),
                    const SizedBox(height: DiceTokens.md),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _topBar(ColorScheme scheme) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: scheme.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(Icons.casino_rounded, color: scheme.onPrimary),
        ),
        const SizedBox(width: DiceTokens.sm),
        Expanded(
          child: Text(
            'ROLL CLUB',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.3,
                ),
          ),
        ),
        IconButton.filledTonal(
          key: const Key('theme_toggle'),
          tooltip: widget.isDark ? 'Switch to light theme' : 'Switch to dark theme',
          onPressed: widget.onToggleTheme,
          icon: Icon(widget.isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
        ),
      ],
    );
  }

  Widget _hero() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.accentStrong, AppTheme.accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(DiceTokens.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'GAME NIGHT, SORTED',
            style: TextStyle(
              color: Color(0xFFDAD5FF),
              letterSpacing: 2.0,
              fontWeight: FontWeight.w800,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: DiceTokens.sm),
          Text(
            'Ready to roll?',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.08,
                ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tap an individual die or throw both. Every roll is a fresh chance.',
            style: TextStyle(color: Color(0xFFE9E6FF), height: 1.45),
          ),
          const SizedBox(height: DiceTokens.md),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _HeroChip(text: '2 DICE'),
              _HeroChip(text: '6 FACES'),
              _HeroChip(text: 'RANDOM RESULTS'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _diceArena() {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(DiceTokens.lg),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(DiceTokens.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Your dice',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              Text(
                _rolling ? 'ROLLING…' : 'READY',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w900,
                      color: scheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Tap either die to roll it individually.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: DiceTokens.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final tileWidth = (constraints.maxWidth - DiceTokens.sm) / 2;
              final dieSize = (tileWidth - 26).clamp(60.0, 132.0).toDouble();
              return Row(
                children: [
                  Expanded(
                    child: DiceTile(
                      key: const Key('left_die'),
                      label: 'Left',
                      value: _session.left,
                      onTap: () => _roll(DiceTarget.left),
                      animation: _rollAnimation,
                      animate: _rolling &&
                          (_activeTarget == DiceTarget.left ||
                              _activeTarget == DiceTarget.both),
                      enabled: !_rolling,
                      dieSize: dieSize,
                    ),
                  ),
                  const SizedBox(width: DiceTokens.sm),
                  Expanded(
                    child: DiceTile(
                      key: const Key('right_die'),
                      label: 'Right',
                      value: _session.right,
                      onTap: () => _roll(DiceTarget.right),
                      animation: _rollAnimation,
                      animate: _rolling &&
                          (_activeTarget == DiceTarget.right ||
                              _activeTarget == DiceTarget.both),
                      enabled: !_rolling,
                      dieSize: dieSize,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: DiceTokens.lg),
          RollSummary(total: _session.total, lastRoll: _session.lastRoll),
          const SizedBox(height: DiceTokens.md),
          FilledButton.icon(
            key: const Key('roll_both_button'),
            onPressed: _rolling ? null : () => _roll(DiceTarget.both),
            icon: const Icon(Icons.casino_rounded),
            label: Text(_rolling ? 'Rolling…' : 'Roll both dice'),
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.center,
            child: TextButton.icon(
              key: const Key('clear_history_button'),
              onPressed: _rolling || _session.rollCount == 0
                  ? null
                  : () => _confirmClearHistory(),
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              label: const Text('Clear history'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmClearHistory() async {
    final clear = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear roll history?'),
        content: const Text(
          'This removes your session statistics and recorded rolls. '
          'The current dice faces will remain unchanged.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (clear == true && mounted) _session.clearHistory();
  }
}

class _HeroChip extends StatelessWidget {
  const _HeroChip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(38),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withAlpha(56)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}
