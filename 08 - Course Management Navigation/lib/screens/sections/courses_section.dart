import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../../state/course_store.dart';
import '../../widgets/course_card.dart';

/// Three peer views inside Courses (not three navigation routes).
class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key, required this.store, required this.onOpenCourse});
  final CourseStore store;
  final ValueChanged<Course> onOpenCourse;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Course library', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text('Browse courses by progress. Tap any course to open its details.',
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w800),
                  tabs: const [
                    Tab(text: 'All courses'),
                    Tab(text: 'In progress'),
                    Tab(text: 'Completed'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: AnimatedBuilder(
                  animation: store,
                  builder: (context, _) => TabBarView(children: [
                    _CourseList(key: const PageStorageKey('all'), courses: store.courses, onOpenCourse: onOpenCourse),
                    _CourseList(key: const PageStorageKey('in-progress'), courses: store.inProgress, onOpenCourse: onOpenCourse),
                    _CourseList(key: const PageStorageKey('completed'), courses: store.completed, onOpenCourse: onOpenCourse),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseList extends StatelessWidget {
  const _CourseList({super.key, required this.courses, required this.onOpenCourse});
  final List<Course> courses;
  final ValueChanged<Course> onOpenCourse;

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return Center(child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.inbox_outlined, size: 50, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 10),
          const Text('No courses in this tab yet.'),
        ]),
      ));
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
      itemCount: courses.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final course = courses[index];
        return CourseCard(
          course: course,
          onTap: () => onOpenCourse(course),
        );
      },
    );
  }
}
