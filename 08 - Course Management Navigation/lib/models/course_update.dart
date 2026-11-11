/// Typed result sent back by Navigator.pop from a Course Details route.
class CourseUpdate {
  const CourseUpdate({
    required this.courseId,
    required this.isFavorite,
    required this.isCompleted,
  });

  final String courseId;
  final bool isFavorite;
  final bool isCompleted;
}
