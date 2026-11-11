import 'package:flutter/material.dart';

import '../models/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
    this.compact = false,
  });
  final Course course;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final done = course.status == CourseStatus.completed;
    return Card(
      child: InkWell(
        key: Key('course-${course.id}'),
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(compact ? 16 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  width: 45, height: 45,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(Icons.auto_stories_rounded, color: colors.onPrimaryContainer),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.code, style: TextStyle(
                        fontSize: 12, color: colors.primary,
                        fontWeight: FontWeight.w800, letterSpacing: 0.3,
                      )),
                      const SizedBox(height: 2),
                      Text(course.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                if (course.isFavorite) ...[
                  const SizedBox(width: 6),
                  Icon(Icons.favorite_rounded, color: colors.primary, size: 19),
                ],
                const SizedBox(width: 4),
                Icon(Icons.chevron_right_rounded, color: colors.onSurfaceVariant),
              ]),
              const SizedBox(height: 15),
              Wrap(spacing: 12, runSpacing: 8, children: [
                _DetailsLabel(icon: Icons.school_outlined, text: '${course.credits} credits'),
                _DetailsLabel(icon: Icons.person_outline, text: course.instructor),
              ]),
              if (!compact) ...[
                const SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: course.progress,
                    minHeight: 7,
                    backgroundColor: colors.primaryContainer.withValues(alpha: 0.4),
                  ),
                ),
                const SizedBox(height: 7),
                Row(children: [
                  Text(done ? 'Completed' : 'In progress',
                      style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  Text('${(course.progress * 100).round()}%',
                      style: TextStyle(fontSize: 12, color: colors.primary, fontWeight: FontWeight.w800)),
                ]),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailsLabel extends StatelessWidget {
  const _DetailsLabel({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 15, color: Theme.of(context).colorScheme.onSurfaceVariant),
      const SizedBox(width: 5),
      Flexible(child: Text(text, style: TextStyle(
        fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant,
      ))),
    ]);
  }
}
