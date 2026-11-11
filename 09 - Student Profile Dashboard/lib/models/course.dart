class Course {
  const Course({
    required this.code,
    required this.title,
    required this.instructor,
    required this.schedule,
    required this.location,
    required this.credits,
  });

  final String code;
  final String title;
  final String instructor;
  final String schedule;
  final String location;
  final int credits;
}
