import 'package:flutter/material.dart';
import '../models/student_profile.dart';

class SemesterProgressCard extends StatelessWidget {
  const SemesterProgressCard({super.key, required this.student});

  final StudentProfile student;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.school_outlined, color: scheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text('Degree progress',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w800)),
                ),
                Text('${(student.creditProgress * 100).round()}%',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: scheme.primary, fontWeight: FontWeight.w800)),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                minHeight: 9,
                value: student.creditProgress,
                semanticsLabel: 'Credit completion progress',
              ),
            ),
            const SizedBox(height: 14),
            Text('${student.earnedCredits} of ${student.requiredCredits} required credits completed',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: scheme.onSurfaceVariant)),
            const SizedBox(height: 7),
            Text('Keep it going — you are on track for graduation.',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: scheme.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
