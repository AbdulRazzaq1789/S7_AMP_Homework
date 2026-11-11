import 'package:flutter/material.dart';

import '../models/student.dart';
import '../theme/app_palette.dart';
import '../widgets/academic_progress_card.dart';
import '../widgets/biography_card.dart';
import '../widgets/hot_reload_demo_card.dart';
import '../widgets/interest_chips.dart';
import '../widgets/local_theme_card.dart';
import '../widgets/metric_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/section_heading.dart';
import '../widgets/student_information_card.dart';

/// The profile screen is StatefulWidget because Save Profile changes its UI.
class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key, required this.student, required this.isDark, required this.onToggleTheme});
  final Student student;
  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  bool _saved = false;

  @override
  Widget build(BuildContext context) {
    final student = widget.student;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        titleSpacing: 20,
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 39, height: 39,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.school_rounded, color: Theme.of(context).colorScheme.onPrimaryContainer)),
          const SizedBox(width: 10),
          const Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min,
            children: [
              Text('CAMPUS', style: TextStyle(fontSize: 12, letterSpacing: 2, fontWeight: FontWeight.w900)),
              Text('Student portal', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
            ],
          ),
        ]),
        actions: [
          IconButton(
            key: const Key('theme_toggle_button'),
            tooltip: widget.isDark ? 'Switch to light theme' : 'Switch to dark theme',
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(child: LayoutBuilder(builder: (context, viewport) {
        final outerPadding = viewport.maxWidth >= 800 ? 28.0 : 16.0;
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(outerPadding, 12, outerPadding, 40),
          child: Center(child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1020),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ProfileHeader(student: student, isSaved: _saved,
                onSaveToggle: () => setState(() => _saved = !_saved)),
              const SizedBox(height: AppSpacing.xxl),
              const SectionHeading(title: 'Academic snapshot', subtitle: 'A quick look at this semester'),
              const SizedBox(height: AppSpacing.lg),
              LayoutBuilder(builder: (context, space) {
                final columns = space.maxWidth >= 740 ? 3 : (space.maxWidth >= 420 ? 2 : 1);
                const gap = 12.0;
                final width = (space.maxWidth - (columns - 1) * gap) / columns;
                return Wrap(spacing: gap, runSpacing: gap, children: [
                  SizedBox(width: width, child: MetricCard(
                    title: 'Current GPA', value: student.gpa.toStringAsFixed(2),
                    icon: Icons.workspace_premium_outlined, iconColor: Theme.of(context).colorScheme.primary)),
                  SizedBox(width: width, child: MetricCard(
                    title: 'Credits earned', value: '${student.creditsEarned}',
                    icon: Icons.fact_check_outlined, iconColor: AppPalette.mint)),
                  SizedBox(width: width, child: MetricCard(
                    title: 'Current courses', value: '${student.currentCourses}',
                    icon: Icons.auto_stories_outlined, iconColor: AppPalette.sky)),
                ]);
              }),
              const SizedBox(height: AppSpacing.lg),
              AcademicProgressCard(student: student),
              const SizedBox(height: AppSpacing.xxl),
              const SectionHeading(title: 'Get to know me', subtitle: 'Student details and interests'),
              const SizedBox(height: AppSpacing.lg),
              LayoutBuilder(builder: (context, space) {
                if (space.maxWidth < 740) {
                  return Column(children: [
                    BiographyCard(student: student),
                    const SizedBox(height: AppSpacing.md),
                    StudentInformationCard(student: student),
                  ]);
                }
                return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: BiographyCard(student: student)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(child: StudentInformationCard(student: student)),
                ]);
              }),
              const SizedBox(height: AppSpacing.lg),
              InterestChips(interests: student.interests),
              const SizedBox(height: AppSpacing.xxl),
              const SectionHeading(title: 'Flutter demonstrations', subtitle: 'Two interactive examples from Lecture 2'),
              const SizedBox(height: AppSpacing.lg),
              LayoutBuilder(builder: (context, space) {
                if (space.maxWidth < 740) {
                  return const Column(children: [
                    LocalThemeCard(),
                    SizedBox(height: AppSpacing.md),
                    HotReloadDemoCard(),
                  ]);
                }
                return const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: LocalThemeCard()),
                  SizedBox(width: AppSpacing.md),
                  Expanded(child: HotReloadDemoCard()),
                ]);
              }),
              const SizedBox(height: AppSpacing.xl),
              Center(child: Text('Advanced Mobile Programming  •  Week 02',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant))),
            ]),
          )),
        );
      })),
    );
  }
}
