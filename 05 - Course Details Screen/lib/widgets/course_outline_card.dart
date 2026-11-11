import 'package:flutter/material.dart';

import '../models/course.dart';
import '../theme/app_theme.dart';
import 'section_card.dart';

class CourseOutlineCard extends StatelessWidget {
  const CourseOutlineCard({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Course outline',
      icon: Icons.format_list_bulleted_rounded,
      subtitle: 'Topics and skills covered',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Learning outcomes',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15)),
          const SizedBox(height: 12),
          for (final objective in course.objectives) ...<Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(Icons.check_circle_rounded, size: 17,
                      color: Color(0xFF1F947D)),
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(objective, softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium)),
              ],
            ),
            const SizedBox(height: 11),
          ],
          const SizedBox(height: 14),
          Text('Main topics',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              for (final topic in course.topics)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF3FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(topic, style: const TextStyle(
                    color: AppPalette.blue, fontSize: 12,
                    fontWeight: FontWeight.w700,
                  )),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
