import 'package:flutter/material.dart';

import '../models/course.dart';
import '../models/student_profile.dart';
import '../widgets/info_row.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/section_title.dart';

/// MaterialPageRoute destination reached from the dashboard (Week 8 concept).
class StudentDetailsScreen extends StatelessWidget {
  const StudentDetailsScreen({super.key, required this.student});

  final StudentProfile student;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Student details')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 30),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Row(
                      children: [
                        ProfileAvatar(size: 92, heroTag: 'student-avatar'),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(student.name,
                                  maxLines: 2,
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w800)),
                              const SizedBox(height: 5),
                              Text(student.department,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: scheme.onSurfaceVariant,
                                  )),
                              const SizedBox(height: 5),
                              Text('Student ID ${student.studentId}',
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: scheme.primary,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(title: 'About Amina',
                            subtitle: 'A little more about this student.'),
                        const SizedBox(height: 15),
                        Text(student.biography,
                            style: theme.textTheme.bodyLarge?.copyWith(height: 1.65)),
                        const SizedBox(height: 18),
                        Text('Interests',
                            style: theme.textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 10),
                        Wrap(spacing: 8, runSpacing: 8, children: [
                          for (final interest in student.interests)
                            Chip(label: Text(interest)),
                        ]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                LayoutBuilder(builder: (context, constraints) {
                  final contact = _ContactCard(student: student);
                  final academic = _AcademicCard(student: student);
                  if (constraints.maxWidth < 730) {
                    return Column(children: [
                      contact,
                      const SizedBox(height: 18),
                      academic,
                    ]);
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: contact),
                      const SizedBox(width: 18),
                      Expanded(child: academic),
                    ],
                  );
                }),
                const SizedBox(height: 18),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(title: 'Enrolled courses',
                            subtitle: 'Current semester course schedule.'),
                        const SizedBox(height: 10),
                        for (var i = 0; i < student.courses.length; i++) ...[
                          _CourseDetailsRow(course: student.courses[i]),
                          if (i < student.courses.length - 1) const Divider(),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Back to dashboard'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.student});
  final StudentProfile student;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Contact'),
              const SizedBox(height: 12),
              InfoRow(icon: Icons.mail_outline_rounded,
                  label: 'University email', value: student.email),
              const Divider(),
              InfoRow(icon: Icons.place_outlined,
                  label: 'Location', value: student.location),
            ],
          ),
        ),
      );
}

class _AcademicCard extends StatelessWidget {
  const _AcademicCard({required this.student});
  final StudentProfile student;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Academic profile'),
              const SizedBox(height: 12),
              InfoRow(icon: Icons.grade_outlined,
                  label: 'GPA', value: '${student.gpa.toStringAsFixed(2)} / 4.00'),
              const Divider(),
              InfoRow(icon: Icons.school_outlined,
                  label: 'Semester', value: '${student.semester} of ${student.totalSemesters}'),
              const Divider(),
              InfoRow(icon: Icons.task_alt_outlined,
                  label: 'Credits', value: '${student.earnedCredits} / ${student.requiredCredits}'),
            ],
          ),
        ),
      );
}

class _CourseDetailsRow extends StatelessWidget {
  const _CourseDetailsRow({required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(course.title,
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text('${course.code} · ${course.credits} credits',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
              )),
          const SizedBox(height: 7),
          Text('${course.schedule} · ${course.location}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
          const SizedBox(height: 3),
          Text(course.instructor,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
        ],
      ),
    );
  }
}
