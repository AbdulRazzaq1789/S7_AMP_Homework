import 'package:flutter_test/flutter_test.dart';
import 'package:week_09_student_profile_dashboard/data/sample_student.dart';
import 'package:week_09_student_profile_dashboard/models/student_profile.dart';

void main() {
  test('sample student has the expected academic progress', () {
    expect(sampleStudent.earnedCredits, 112);
    expect(sampleStudent.creditProgress, closeTo(.8, .0001));
    expect(sampleStudent.semesterProgress, closeTo(.875, .0001));
    expect(sampleStudent.courses, hasLength(3));
  });

  test('a profile with zero requirements has safe progress values', () {
    const profile = StudentProfile(
      name: 'Test', studentId: '1', department: 'SE',
      semester: 0, totalSemesters: 0, gpa: 0,
      earnedCredits: 0, requiredCredits: 0,
      email: 'test@example.com', location: 'Test', biography: '',
      interests: [], courses: [],
    );
    expect(profile.creditProgress, 0);
    expect(profile.semesterProgress, 0);
  });
}
