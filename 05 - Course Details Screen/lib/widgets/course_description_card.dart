import 'package:flutter/material.dart';

import '../models/course.dart';
import 'section_card.dart';

/// A long Text layout inside a scrolling page: deliberately no maxLines,
/// fixed height or horizontal scroll that could clip/overflow the content.
class CourseDescriptionCard extends StatelessWidget {
  const CourseDescriptionCard({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    final paragraphs = course.description.split('\n\n');
    return SectionCard(
      title: 'About this course',
      icon: Icons.article_outlined,
      subtitle: 'Overview and learning approach',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var i = 0; i < paragraphs.length; i++) ...<Widget>[
            Text(paragraphs[i], softWrap: true,
                style: Theme.of(context).textTheme.bodyMedium),
            if (i < paragraphs.length - 1) const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }
}
