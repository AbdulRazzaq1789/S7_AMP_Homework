import '../models/course.dart';

// Fictional courses for an offline assignment demo, no server required.
const List<Course> demoCourses = [
  Course(
    id: 'cs-301', title: 'Mobile Application Development', code: 'CS.SE.0731',
    credits: 3, instructor: 'Dr. Samira Rahimi', schedule: 'Sun & Tue · 9:00 AM',
    description: 'Develop and test mobile applications using Flutter and Dart. '
        'Explore widgets, navigation, state changes, and cross-platform workflows.',
    progress: 0.72, isFavorite: true,
  ),
  Course(
    id: 'cs-302', title: 'Database Systems', code: 'CS.SE.0524',
    credits: 4, instructor: 'Prof. Haroon Azizi', schedule: 'Mon & Wed · 10:30 AM',
    description: 'Design normalized relational databases, write SQL queries, '
        'and understand transactions, indexing, and data integrity.',
    progress: 0.46,
  ),
  Course(
    id: 'cs-303', title: 'Software Project Management', code: 'CS.SE.0630',
    credits: 3, instructor: 'Dr. Laila Hamidi', schedule: 'Sat & Mon · 8:00 AM',
    description: 'Plan project scope, schedule and resources. Learn estimation, '
        'risk assessment, and delivery methods for software teams.',
    progress: 0.86,
  ),
  Course(
    id: 'cs-304', title: 'Computer Networks', code: 'CS.SE.0412',
    credits: 3, instructor: 'Prof. Yousuf Sadiqi', schedule: 'Tue & Thu · 11:00 AM',
    description: 'Study protocols, routing, addressing, transport layers and '
        'network troubleshooting through practical scenarios.',
    progress: 1.0, status: CourseStatus.completed,
  ),
  Course(
    id: 'cs-305', title: 'Human–Computer Interaction', code: 'CS.SE.0712',
    credits: 2, instructor: 'Ms. Nargis Habibi', schedule: 'Sun · 1:00 PM',
    description: 'Practice usability principles, interface evaluation, '
        'accessibility and interaction design.',
    progress: 0.34,
  ),
  Course(
    id: 'cs-306', title: 'Data Structures', code: 'CS.SE.0310',
    credits: 4, instructor: 'Dr. Bashir Ahmad', schedule: 'Completed',
    description: 'Implement and analyze lists, trees, graphs, sorting and '
        'searching algorithms.',
    progress: 1.0, status: CourseStatus.completed,
  ),
];
