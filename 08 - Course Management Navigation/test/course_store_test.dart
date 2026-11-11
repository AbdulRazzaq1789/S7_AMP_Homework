import 'package:flutter_test/flutter_test.dart';
import 'package:week_08_course_management_navigation_demo/models/course.dart';
import 'package:week_08_course_management_navigation_demo/models/course_update.dart';
import 'package:week_08_course_management_navigation_demo/state/course_store.dart';

void main() {
  test('initial courses are divided into in progress and completed', () {
    final store = CourseStore();
    addTearDown(store.dispose);
    expect(store.courses, hasLength(6));
    expect(store.inProgress, hasLength(4));
    expect(store.completed, hasLength(2));
    expect(store.favoriteCount, 1);
  });

  test('returned result updates course and notifies listeners', () {
    final store = CourseStore();
    addTearDown(store.dispose);
    var notifications = 0;
    store.addListener(() => notifications++);
    final updated = store.applyUpdate(const CourseUpdate(
      courseId: 'cs-301', isFavorite: false, isCompleted: true,
    ));
    expect(updated, isTrue);
    expect(notifications, 1);
    expect(store.favoriteCount, 0);
    final course = store.courses.singleWhere((item) => item.id == 'cs-301');
    expect(course.status, CourseStatus.completed);
    expect(course.progress, 1.0);
    expect(store.inProgress, hasLength(3));
    expect(store.completed, hasLength(3));
  });

  test('no change on an identical or unknown result', () {
    final store = CourseStore();
    addTearDown(store.dispose);
    expect(store.applyUpdate(const CourseUpdate(
      courseId: 'cs-301', isFavorite: true, isCompleted: false,
    )), isFalse);
    expect(store.applyUpdate(const CourseUpdate(
      courseId: 'unknown', isFavorite: true, isCompleted: true,
    )), isFalse);
  });
}
