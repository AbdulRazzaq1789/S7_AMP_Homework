import 'package:flutter_test/flutter_test.dart';
import 'package:week_05_course_detail_screen/data/sample_course.dart';

void main() {
  test('sample course contains the required overview fields', () {
    expect(sampleCourse.code, isNotEmpty);
    expect(sampleCourse.title, isNotEmpty);
    expect(sampleCourse.instructor, isNotEmpty);
    expect(sampleCourse.credits, greaterThan(0));
    expect(sampleCourse.semester, isNotEmpty);
    expect(sampleCourse.description.length, greaterThan(500));
  });
}
