import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../../state/course_store.dart';
import '../../theme/app_theme.dart';
import '../../widgets/course_card.dart';
import '../../widgets/metric_card.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.store,
    required this.onBrowseCourses,
    required this.onOpenCourse,
  });
  final CourseStore store;
  final VoidCallback onBrowseCourses;
  final ValueChanged<Course> onOpenCourse;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 34),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(27),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.brand, Color(0xFF7889E9)],
                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Wrap(
                    spacing: 24, runSpacing: 22,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 540),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Text('FALL SEMESTER 2026',
                              style: TextStyle(color: Color(0xFFE2E7FF), fontSize: 12,
                                  fontWeight: FontWeight.w800, letterSpacing: 1.8)),
                          const SizedBox(height: 10),
                          Text('Welcome back, Student!',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                  color: Colors.white, fontWeight: FontWeight.w900)),
                          const SizedBox(height: 10),
                          const Text('Everything you need to stay on top of your studies.',
                              style: TextStyle(color: Color(0xFFEEF1FF), fontSize: 15, height: 1.45)),
                          const SizedBox(height: 24),
                          FilledButton.icon(
                            key: const Key('browse-courses'),
                            onPressed: onBrowseCourses,
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.white, foregroundColor: AppTheme.brand,
                            ),
                            icon: const Icon(Icons.arrow_forward_rounded),
                            label: const Text('Explore courses'),
                          ),
                        ]),
                      ),
                      const Icon(Icons.auto_stories_rounded, size: 88, color: Color(0xFFE2E7FF)),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text('At a glance', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 14),
                LayoutBuilder(builder: (context, size) {
                  final cols = size.maxWidth >= 760 ? 3 : (size.maxWidth >= 460 ? 2 : 1);
                  final width = (size.maxWidth - (cols - 1) * 12) / cols;
                  return Wrap(spacing: 12, runSpacing: 12, children: [
                    SizedBox(width: width, child: MetricCard(
                      label: 'Enrolled courses', value: '${store.courses.length}',
                      icon: Icons.menu_book_outlined,
                    )),
                    SizedBox(width: width, child: MetricCard(
                      label: 'Completed', value: '${store.completed.length}',
                      icon: Icons.verified_outlined,
                    )),
                    SizedBox(width: width, child: MetricCard(
                      label: 'Favorites', value: '${store.favoriteCount}',
                      icon: Icons.favorite_border_rounded,
                    )),
                  ]);
                }),
                const SizedBox(height: 29),
                Row(children: [
                  Expanded(child: Text('Continue learning',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900))),
                  TextButton(onPressed: onBrowseCourses, child: const Text('View all')),
                ]),
                const SizedBox(height: 13),
                ...store.inProgress.take(2).map((course) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CourseCard(
                    course: course,
                    compact: true,
                    onTap: () => onOpenCourse(course),
                  ),
                )),
                const SizedBox(height: 12),
                Text('Tip: open a course, change its favorite/completion status, '
                    'and save to see the returned result here.',
                    style: theme.textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
