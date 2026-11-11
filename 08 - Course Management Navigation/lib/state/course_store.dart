import 'package:flutter/foundation.dart';

import '../data/demo_courses.dart';
import '../models/course.dart';
import '../models/course_update.dart';

/// Small app-level in-memory store, shared across Home, Courses and Profile.
/// Demonstrates how data returned by a route updates its previous screen.
class CourseStore extends ChangeNotifier {
  CourseStore({List<Course>? initialCourses})
      : _courses = List<Course>.of(initialCourses ?? demoCourses);

  final List<Course> _courses;
  List<Course> get courses => List<Course>.unmodifiable(_courses);
  List<Course> get inProgress => List<Course>.unmodifiable(
        _courses.where((course) => course.status == CourseStatus.inProgress),
      );
  List<Course> get completed => List<Course>.unmodifiable(
        _courses.where((course) => course.status == CourseStatus.completed),
      );
  int get favoriteCount => _courses.where((course) => course.isFavorite).length;
  int get totalCredits => _courses.fold<int>(0, (total, course) => total + course.credits);
  int get completedCredits => completed.fold<int>(0, (total, course) => total + course.credits);

  bool applyUpdate(CourseUpdate update) {
    final index = _courses.indexWhere((course) => course.id == update.courseId);
    if (index < 0) return false;
    final old = _courses[index];
    final targetStatus = update.isCompleted
        ? CourseStatus.completed
        : CourseStatus.inProgress;
    if (old.isFavorite == update.isFavorite && old.status == targetStatus) {
      return false;
    }
    _courses[index] = old.copyWith(
      isFavorite: update.isFavorite,
      status: targetStatus,
      progress: update.isCompleted ? 1.0 : (old.progress == 1.0 ? 0.5 : old.progress),
    );
    notifyListeners();
    return true;
  }
}
