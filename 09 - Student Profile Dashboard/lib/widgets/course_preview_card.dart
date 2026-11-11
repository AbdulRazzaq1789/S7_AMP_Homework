import 'package:flutter/material.dart';
import '../models/course.dart';

class CoursePreviewCard extends StatelessWidget {
  const CoursePreviewCard({super.key, required this.courses});

  final List<Course> courses;

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
                Icon(Icons.calendar_month_outlined, color: scheme.primary),
                const SizedBox(width: 10),
                Text('This week',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w800)),
              ],
            ),
            const SizedBox(height: 17),
            for (final course in courses.take(2)) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.menu_book_rounded,
                        color: scheme.onPrimaryContainer, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.title,
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 5),
                        Text(course.schedule,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              if (course != courses.take(2).last) ...[
                const SizedBox(height: 14),
                const Divider(),
                const SizedBox(height: 14),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
