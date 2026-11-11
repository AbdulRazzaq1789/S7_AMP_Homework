import 'package:flutter/material.dart';

import '../models/tasbih_data.dart';
import '../theme/app_theme.dart';

class GoalSelector extends StatelessWidget {
  const GoalSelector({super.key, required this.selectedGoal, required this.onChanged});
  final int selectedGoal;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: [
      for (final goal in TasbihData.goals)
        ChoiceChip(
          key: Key('goal_$goal'),
          showCheckmark: false,
          label: Text('$goal'),
          selected: goal == selectedGoal,
          onSelected: (_) => onChanged(goal),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: goal == selectedGoal ? AppPalette.pine : AppPalette.ink,
          ),
          selectedColor: AppPalette.mint,
          backgroundColor: Colors.white,
          side: BorderSide(color: goal == selectedGoal ? AppPalette.jade : AppPalette.outline),
        ),
    ],
  );
}
