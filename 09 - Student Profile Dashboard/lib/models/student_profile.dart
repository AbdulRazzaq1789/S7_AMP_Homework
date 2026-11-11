import 'course.dart';

class StudentProfile {
  const StudentProfile({
    required this.name,
    required this.studentId,
    required this.department,
    required this.semester,
    required this.totalSemesters,
    required this.gpa,
    required this.earnedCredits,
    required this.requiredCredits,
    required this.email,
    required this.location,
    required this.biography,
    required this.interests,
    required this.courses,
  });

  final String name;
  final String studentId;
  final String department;
  final int semester;
  final int totalSemesters;
  final double gpa;
  final int earnedCredits;
  final int requiredCredits;
  final String email;
  final String location;
  final String biography;
  final List<String> interests;
  final List<Course> courses;

  double get creditProgress =>
      requiredCredits == 0 ? 0 : (earnedCredits / requiredCredits).clamp(0, 1).toDouble();

  double get semesterProgress =>
      totalSemesters == 0 ? 0 : (semester / totalSemesters).clamp(0, 1).toDouble();
}
