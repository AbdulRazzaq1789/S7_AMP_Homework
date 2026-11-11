import 'package:flutter/material.dart';

import '../models/course.dart';
import '../models/course_update.dart';
import '../theme/app_theme.dart';
import '../widgets/course_detail_line.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required this.course});
  final Course course;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late bool _isFavorite = widget.course.isFavorite;
  late bool _isCompleted = widget.course.status == CourseStatus.completed;

  void _saveAndReturn() {
    // Send a typed result to the course list; Navigator.pop removes this route.
    Navigator.of(context).pop(CourseUpdate(
      courseId: widget.course.id,
      isFavorite: _isFavorite,
      isCompleted: _isCompleted,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final course = widget.course;
    return Scaffold(
      appBar: AppBar(title: const Text('Course details')),
      body: SafeArea(
        child: Center(child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppTheme.brand, Color(0xFF7A8BF4)]),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.menu_book_rounded, color: Colors.white, size: 37),
                  const SizedBox(height: 21),
                  Text(course.code, style: const TextStyle(
                    fontWeight: FontWeight.w800, letterSpacing: 1, color: Color(0xFFE8EDFF),
                  )),
                  const SizedBox(height: 8),
                  Text(course.title,
                    style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white,
                      fontWeight: FontWeight.w900, letterSpacing: -0.8)),
                  const SizedBox(height: 12),
                  Text('${course.credits} credit hours',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                ]),
              ),
              const SizedBox(height: 20),
              Card(child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Course information', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 13),
                  CourseDetailLine(icon: Icons.badge_outlined, label: 'Course code', value: course.code),
                  const Divider(height: 1),
                  CourseDetailLine(icon: Icons.school_outlined, label: 'Credits', value: '${course.credits}'),
                  const Divider(height: 1),
                  CourseDetailLine(icon: Icons.person_outline, label: 'Instructor', value: course.instructor),
                  const Divider(height: 1),
                  CourseDetailLine(icon: Icons.schedule_outlined, label: 'Schedule', value: course.schedule),
                ]),
              )),
              const SizedBox(height: 17),
              Card(child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('About this course', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 11),
                  Text(course.description, style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.55, color: colors.onSurfaceVariant)),
                ]),
              )),
              const SizedBox(height: 17),
              Card(child: Column(children: [
                SwitchListTile.adaptive(
                  key: const Key('favorite-toggle'),
                  secondary: Icon(
                    _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    color: colors.primary,
                  ),
                  title: const Text('Favorite course'),
                  subtitle: const Text('Show this course in favorites count'),
                  value: _isFavorite,
                  onChanged: (value) => setState(() => _isFavorite = value),
                ),
                const Divider(height: 1),
                SwitchListTile.adaptive(
                  key: const Key('complete-toggle'),
                  secondary: Icon(Icons.task_alt_rounded, color: colors.primary),
                  title: const Text('Mark as completed'),
                  subtitle: const Text('Move the course to the Completed tab'),
                  value: _isCompleted,
                  onChanged: (value) => setState(() => _isCompleted = value),
                ),
              ])),
              const SizedBox(height: 24),
              FilledButton.icon(
                key: const Key('save-course-result'),
                onPressed: _saveAndReturn,
                icon: const Icon(Icons.check_rounded),
                label: const Text('Save changes & return'),
              ),
              const SizedBox(height: 10),
              Text('Use the back arrow to leave without saving.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant)),
            ],
          ),
        )),
      ),
    );
  }
}
