import 'package:flutter/material.dart';

import '../data/sample_course.dart';
import '../theme/app_theme.dart';
import '../widgets/course_description_card.dart';
import '../widgets/course_hero.dart';
import '../widgets/course_outline_card.dart';
import '../widgets/course_overview_card.dart';
import '../widgets/instructor_contact_card.dart';

/// Single, responsive assignment screen. Content is intentionally scrollable.
class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  final GlobalKey _outlineKey = GlobalKey();
  bool _saved = false;

  void _toggleSaved() {
    setState(() => _saved = !_saved);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(_saved ? 'Course saved to your list' : 'Course removed from saved'),
        duration: const Duration(seconds: 2),
      ));
  }

  void _scrollToOutline() {
    final target = _outlineKey.currentContext;
    if (target != null) {
      Scrollable.ensureVisible(target,
        alignment: 0.08,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppPalette.navy,
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Icon(Icons.school_rounded, color: Colors.white,
                  size: 19),
            ),
            const SizedBox(width: 11),
            const Flexible(
              child: Text('Course details',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            tooltip: _saved ? 'Remove saved course' : 'Save course',
            onPressed: _toggleSaved,
            icon: Icon(_saved ? Icons.bookmark_rounded
                : Icons.bookmark_border_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            wide ? 32 : 16, 16, wide ? 32 : 16, 38,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CourseHero(
                    course: sampleCourse,
                    saved: _saved,
                    onSave: _toggleSaved,
                    onViewOutline: _scrollToOutline,
                  ),
                  const SizedBox(height: 18),
                  CourseOverviewCard(course: sampleCourse),
                  const SizedBox(height: 18),
                  if (wide)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              CourseDescriptionCard(course: sampleCourse),
                              const SizedBox(height: 18),
                              KeyedSubtree(
                                key: _outlineKey,
                                child: CourseOutlineCard(course: sampleCourse),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          flex: 2,
                          child: InstructorContactCard(course: sampleCourse),
                        ),
                      ],
                    )
                  else ...<Widget>[
                    CourseDescriptionCard(course: sampleCourse),
                    const SizedBox(height: 18),
                    InstructorContactCard(course: sampleCourse),
                    const SizedBox(height: 18),
                    KeyedSubtree(
                      key: _outlineKey,
                      child: CourseOutlineCard(course: sampleCourse),
                    ),
                  ],
                  const SizedBox(height: 24),
                  Center(
                    child: Text('Advanced Mobile Programming  •  Week 05',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium),
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
