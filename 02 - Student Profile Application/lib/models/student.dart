/// Immutable sample domain model used by the profile UI.
class Student {
  const Student({
    required this.name,
    required this.studentId,
    required this.department,
    required this.semester,
    required this.university,
    required this.email,
    required this.shortBiography,
    required this.extendedBiography,
    required this.gpa,
    required this.creditsEarned,
    required this.creditsRequired,
    required this.currentCourses,
    required this.enrolledOn,
    required this.interests,
  }) : assert(creditsRequired > 0),
       assert(creditsEarned >= 0),
       assert(creditsEarned <= creditsRequired);

  final String name;
  final String studentId;
  final String department;
  final int semester;
  final String university;
  final String email;
  final String shortBiography;
  final String extendedBiography;
  final double gpa;
  final int creditsEarned;
  final int creditsRequired;
  final int currentCourses;
  final DateTime enrolledOn;
  final List<String> interests;

  double get progress => creditsEarned / creditsRequired;
  int get progressPercent => (progress * 100).round();
  String get initials {
    final words = name.trim().split(RegExp(r'\s+'));
    return words.take(2).map((word) => word[0].toUpperCase()).join();
  }
}
