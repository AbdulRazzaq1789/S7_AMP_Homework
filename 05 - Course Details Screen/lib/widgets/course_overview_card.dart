import 'package:flutter/material.dart';

import '../models/course.dart';
import '../theme/app_theme.dart';
import 'section_card.dart';

class CourseOverviewCard extends StatelessWidget {
  const CourseOverviewCard({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'At a glance',
      icon: Icons.grid_view_rounded,
      subtitle: 'Quick course information',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final credits = _InfoTile(
            label: 'Credits',
            value: '${course.credits} credits',
            icon: Icons.workspace_premium_outlined,
          );
          final semester = _InfoTile(
            label: 'Semester',
            value: course.semester,
            icon: Icons.calendar_month_outlined,
          );
          final instructor = _InfoTile(
            label: 'Instructor',
            value: course.instructor,
            icon: Icons.person_outline_rounded,
          );

          if (constraints.maxWidth < 520) {
            return Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: credits),
                    const SizedBox(width: 12),
                    Expanded(child: semester),
                  ],
                ),
                const SizedBox(height: 12),
                instructor,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: credits),
              const SizedBox(width: 12),
              Expanded(child: semester),
              const SizedBox(width: 12),
              Expanded(flex: 2, child: instructor),
            ],
          );
        },
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.label, required this.value,
    required this.icon});
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppPalette.background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 19, color: AppPalette.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(label, style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 5),
                Text(value, softWrap: true,
                  style: const TextStyle(fontWeight: FontWeight.w700,
                      fontSize: 13, color: AppPalette.ink)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
