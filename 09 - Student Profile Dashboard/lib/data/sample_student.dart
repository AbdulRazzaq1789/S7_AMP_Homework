import '../models/course.dart';
import '../models/student_profile.dart';

/// Fictional data: the homework runs offline without authentication or APIs.
const sampleStudent = StudentProfile(
  name: 'Amina Rahimi',
  studentId: 'SE-2026-1042',
  department: 'Software Engineering',
  semester: 7,
  totalSemesters: 8,
  gpa: 3.86,
  earnedCredits: 112,
  requiredCredits: 140,
  email: 'amina.rahimi@campus.example',
  location: 'Kabul, Afghanistan',
  biography:
      'I am a Software Engineering student focused on making thoughtful mobile '
      'experiences. I enjoy exploring Flutter, accessibility, practical design '
      'systems, and the little details that help apps feel effortless.',
  interests: <String>[
    'Flutter',
    'UI Design',
    'Mobile Development',
    'Software Architecture',
  ],
  courses: <Course>[
    Course(
      code: 'CS.SE.0731',
      title: 'Advanced Mobile Programming',
      instructor: 'Prof. R. Khaliqyar',
      schedule: 'Sunday · 09:00–10:30',
      location: 'Computer Lab 2',
      credits: 3,
    ),
    Course(
      code: 'CS.SE.0735',
      title: 'Software Project Management',
      instructor: 'Dr. M. Rahman',
      schedule: 'Tuesday · 10:45–12:15',
      location: 'Room A-204',
      credits: 3,
    ),
    Course(
      code: 'CS.SE.0740',
      title: 'Software Quality Assurance',
      instructor: 'Prof. S. Niazi',
      schedule: 'Wednesday · 08:00–09:30',
      location: 'Room B-102',
      credits: 3,
    ),
  ],
);
