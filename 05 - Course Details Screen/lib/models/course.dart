/// Immutable presentation data for the course detail example.
class Course {
  const Course({
    required this.title,
    required this.code,
    required this.department,
    required this.semester,
    required this.credits,
    required this.instructor,
    required this.instructorTitle,
    required this.email,
    required this.office,
    required this.officeHours,
    required this.description,
    required this.objectives,
    required this.topics,
  });

  final String title;
  final String code;
  final String department;
  final String semester;
  final int credits;
  final String instructor;
  final String instructorTitle;
  final String email;
  final String office;
  final String officeHours;
  final String description;
  final List<String> objectives;
  final List<String> topics;
}
