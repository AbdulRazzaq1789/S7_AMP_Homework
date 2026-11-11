import 'package:flutter/material.dart';

import '../models/student_profile.dart';
import '../theme/app_theme.dart';
import '../widgets/course_preview_card.dart';
import '../widgets/metric_card.dart';
import '../widgets/profile_hero.dart';
import '../widgets/section_title.dart';
import '../widgets/semester_progress_card.dart';
import 'student_details_screen.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({
    super.key,
    required this.student,
    required this.onToggleTheme,
  });

  final StudentProfile student;
  final VoidCallback onToggleTheme;

  void _openProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => StudentDetailsScreen(student: student),
        settings: const RouteSettings(name: '/student-details'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.colorScheme.primary,
              ),
              child: const Icon(Icons.school_rounded, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 11),
            Text('Campus',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5)),
          ],
        ),
        actions: [
          IconButton(
            key: const Key('theme-toggle'),
            tooltip: dark ? 'Switch to light mode' : 'Switch to dark mode',
            onPressed: onToggleTheme,
            icon: Icon(dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(
                    key: Key('dashboard-title'),
                    title: 'My dashboard',
                    subtitle: 'Your academic journey, at a glance.',
                  ),
                  const SizedBox(height: 22),
                  ProfileHero(
                    student: student,
                    onOpenDetails: () => _openProfile(context),
                  ),
                  const SizedBox(height: 28),
                  const SectionTitle(
                      title: 'Academic overview',
                      subtitle: 'A snapshot of your current semester.'),
                  const SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final columns = width >= 840 ? 3 : (width >= 530 ? 2 : 1);
                      const gap = 14.0;
                      final itemWidth = (width - gap * (columns - 1)) / columns;
                      final cards = <Widget>[
                        MetricCard(
                          title: 'Current GPA',
                          value: student.gpa.toStringAsFixed(2),
                          caption: 'On a 4.0 grading scale',
                          icon: Icons.auto_graph_rounded,
                          accent: theme.colorScheme.primary,
                        ),
                        MetricCard(
                          title: 'Earned credits',
                          value: '${student.earnedCredits}',
                          caption: '${student.requiredCredits} needed to graduate',
                          icon: Icons.workspace_premium_outlined,
                          accent: AppTheme.mint,
                        ),
                        MetricCard(
                          title: 'Current semester',
                          value: '${student.semester} / ${student.totalSemesters}',
                          caption: 'Almost at the finish line',
                          icon: Icons.local_library_outlined,
                          accent: const Color(0xFFE39A40),
                        ),
                      ];
                      return Wrap(
                        spacing: gap,
                        runSpacing: gap,
                        children: [
                          for (final card in cards)
                            SizedBox(width: itemWidth, child: card),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  LayoutBuilder(builder: (context, constraints) {
                    final wide = constraints.maxWidth >= 760;
                    final left = SemesterProgressCard(student: student);
                    final right = CoursePreviewCard(courses: student.courses);
                    if (!wide) {
                      return Column(children: [
                        left,
                        const SizedBox(height: 14),
                        right,
                      ]);
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: left),
                        const SizedBox(width: 14),
                        Expanded(child: right),
                      ],
                    );
                  }),
                  const SizedBox(height: 26),
                  Center(
                    child: Text(
                      'Built with Flutter • Advanced Mobile Programming',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
