import 'package:flutter/material.dart';

import '../models/student.dart';

class AcademicProgressCard extends StatelessWidget {
  const AcademicProgressCard({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(child: Padding(padding: const EdgeInsets.all(22), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(Icons.trending_up, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(child: Text('Degree progress', style: theme.textTheme.titleMedium)),
          Text('${student.progressPercent}%', style: theme.textTheme.titleMedium),
        ]),
        const SizedBox(height: 17),
        ClipRRect(borderRadius: BorderRadius.circular(12),
          child: LinearProgressIndicator(minHeight: 10, value: student.progress)),
        const SizedBox(height: 10),
        Text('${student.creditsEarned} of ${student.creditsRequired} credits completed',
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
      ],
    )));
  }
}
