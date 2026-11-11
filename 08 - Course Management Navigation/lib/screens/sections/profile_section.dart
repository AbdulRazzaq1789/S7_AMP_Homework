import 'package:flutter/material.dart';

import '../../state/course_store.dart';
import '../../widgets/metric_card.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, required this.store});
  final CourseStore store;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
        child: Center(child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Card(child: Padding(
              padding: const EdgeInsets.all(24),
              child: Wrap(spacing: 18, runSpacing: 14,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: colors.primaryContainer,
                    child: Text('AS', style: textTheme.titleLarge?.copyWith(
                      color: colors.onPrimaryContainer,
                      fontWeight: FontWeight.w900,
                    )),
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Alex Student', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 5),
                    Text('Software Engineering · Semester 6',
                        style: textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant)),
                    const SizedBox(height: 5),
                    const Text('Student ID · SE-2026-0182', style: TextStyle(fontSize: 12)),
                  ]),
                ],
              ),
            )),
            const SizedBox(height: 23),
            Text('My learning summary', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 12),
            LayoutBuilder(builder: (context, box) {
              final twoColumns = box.maxWidth >= 540;
              final width = twoColumns ? (box.maxWidth - 12) / 2 : box.maxWidth;
              return Wrap(spacing: 12, runSpacing: 12, children: [
                SizedBox(width: width, child: MetricCard(
                  label: 'Credits enrolled', value: '${store.totalCredits}',
                  icon: Icons.school_outlined,
                )),
                SizedBox(width: width, child: MetricCard(
                  label: 'Credits completed', value: '${store.completedCredits}',
                  icon: Icons.task_alt_rounded,
                )),
                SizedBox(width: width, child: MetricCard(
                  label: 'Favorite courses', value: '${store.favoriteCount}',
                  icon: Icons.favorite_border_rounded,
                )),
                SizedBox(width: width, child: MetricCard(
                  label: 'Courses in progress', value: '${store.inProgress.length}',
                  icon: Icons.auto_stories_outlined,
                )),
              ]);
            }),
            const SizedBox(height: 20),
            Text('This profile uses fictional information. Course figures update '
                'when you save changes in Course Details.',
                style: textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant)),
          ]),
        )),
      ),
    );
  }
}
