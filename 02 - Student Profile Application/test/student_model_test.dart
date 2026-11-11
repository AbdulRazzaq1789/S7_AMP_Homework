import 'package:flutter_test/flutter_test.dart';
import 'package:week_02_student_profile_application/data/sample_student.dart';
import 'package:week_02_student_profile_application/models/student.dart';

void main() {
  test('sample student contains all required lecture profile fields', () {
    expect(sampleStudent.name, isNotEmpty);
    expect(sampleStudent.department, isNotEmpty);
    expect(sampleStudent.semester, greaterThan(0));
    expect(sampleStudent.shortBiography, isNotEmpty);
  });

  test('progress percentage and initials are calculated correctly', () {
    expect(sampleStudent.progressPercent, 78);
    expect(sampleStudent.initials, 'AR');
    expect(sampleStudent.progress, closeTo(112 / 144, 0.00001));
  });
}
