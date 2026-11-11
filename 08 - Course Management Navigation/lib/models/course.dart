enum CourseStatus { inProgress, completed }

class Course {
  const Course({
    required this.id,
    required this.title,
    required this.code,
    required this.credits,
    required this.instructor,
    required this.description,
    required this.schedule,
    required this.progress,
    this.status = CourseStatus.inProgress,
    this.isFavorite = false,
  });

  final String id;
  final String title;
  final String code;
  final int credits;
  final String instructor;
  final String description;
  final String schedule;
  final double progress;
  final CourseStatus status;
  final bool isFavorite;

  Course copyWith({CourseStatus? status, bool? isFavorite, double? progress}) {
    return Course(
      id: id,
      title: title,
      code: code,
      credits: credits,
      instructor: instructor,
      description: description,
      schedule: schedule,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
