import 'package:flutter/material.dart';

import '../models/course.dart';
import '../models/course_update.dart';
import '../navigation/app_routes.dart';
import '../state/course_store.dart';
import '../widgets/workspace_drawer.dart';
import 'course_details_screen.dart';
import 'sections/courses_section.dart';
import 'sections/home_section.dart';
import 'sections/profile_section.dart';
import 'sections/settings_section.dart';

class WorkspaceScreen extends StatefulWidget {
  const WorkspaceScreen({
    super.key,
    required this.store,
    required this.darkMode,
    required this.onDarkModeChanged,
  });

  final CourseStore store;
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;

  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  int _selectedIndex = 0;
  static const titles = ['Overview', 'My courses', 'My profile', 'Settings'];

  void _navigateToSection(int index) {
    // A drawer changes the selected section; it does not push a new route.
    Navigator.of(context).pop();
    setState(() => _selectedIndex = index);
  }

  Future<void> _openCourse(Course course) async {
    // Pass title, code and credits as part of a typed Course object.
    // MaterialPageRoute provides the detail transition.
    final result = await Navigator.of(context).push<CourseUpdate>(
      MaterialPageRoute(
        builder: (_) => CourseDetailsScreen(course: course),
      ),
    );
    if (!mounted || result == null) return;
    final updated = widget.store.applyUpdate(result);
    if (updated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Changes saved for ${course.code}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeSection(
        store: widget.store,
        onBrowseCourses: () => setState(() => _selectedIndex = 1),
        onOpenCourse: _openCourse,
      ),
      CoursesSection(store: widget.store, onOpenCourse: _openCourse),
      ProfileSection(store: widget.store),
      SettingsSection(
        darkMode: widget.darkMode,
        onDarkModeChanged: widget.onDarkModeChanged,
      ),
    ];
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      drawer: WorkspaceDrawer(selectedIndex: _selectedIndex, onSelected: _navigateToSection),
      appBar: AppBar(
        leading: Builder(builder: (innerContext) => IconButton(
          tooltip: 'Open navigation menu',
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(innerContext).openDrawer(),
        )),
        title: Text(titles[_selectedIndex]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Chip(
              avatar: Icon(Icons.circle, color: colors.primary, size: 10),
              label: const Text('DEMO', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11)),
              visualDensity: VisualDensity.compact,
            )),
          ),
        ],
      ),
      // IndexedStack preserves scroll position and the selected course tab
      // when changing Drawer destinations.
      body: IndexedStack(index: _selectedIndex, children: pages),
    );
  }
}
