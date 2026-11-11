import 'package:flutter/material.dart';

import '../models/course.dart';
import '../theme/app_theme.dart';
import 'section_card.dart';

/// Explicitly demonstrates a nested Row/Column contact-details layout.
class InstructorContactCard extends StatelessWidget {
  const InstructorContactCard({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Instructor & contact',
      icon: Icons.contact_page_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 26,
                backgroundColor: const Color(0xFFDBEAFE),
                child: Text(course.instructor.split(' ').map((s) => s[0]).take(2).join(),
                    style: const TextStyle(fontWeight: FontWeight.w800,
                        color: AppPalette.blue, fontSize: 16)),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(course.instructor, softWrap: true,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800,
                            color: AppPalette.ink)),
                    const SizedBox(height: 3),
                    Text(course.instructorTitle,
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(height: 1, color: AppPalette.line),
          const SizedBox(height: 14),
          _ContactDetail(icon: Icons.alternate_email_rounded,
              label: 'Email (example)', value: course.email),
          const SizedBox(height: 14),
          _ContactDetail(icon: Icons.location_on_outlined,
              label: 'Office', value: course.office),
          const SizedBox(height: 14),
          _ContactDetail(icon: Icons.schedule_outlined,
              label: 'Office hours', value: course.officeHours),
        ],
      ),
    );
  }
}

class _ContactDetail extends StatelessWidget {
  const _ContactDetail({required this.icon, required this.label,
    required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon, size: 19, color: AppPalette.blue),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(label, style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 3),
              Text(value, softWrap: true,
                  style: const TextStyle(fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppPalette.ink, height: 1.5)),
            ],
          ),
        ),
      ],
    );
  }
}
