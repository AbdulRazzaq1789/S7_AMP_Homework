import '../models/course.dart';

/// Demonstration data, not an official university timetable or credit record.
/// The title, course identifier and instructor name are from the course slides;
/// semester, credit total, contact details and outline are sample UI content.
const sampleCourse = Course(
  title: 'Advanced Mobile Programming',
  code: 'CS.SE.0731',
  department: 'Software Engineering',
  semester: 'Semester 7',
  credits: 3,
  instructor: 'Roheed Khaliqyar',
  instructorTitle: 'Assistant Professor',
  email: 'instructor@example.edu',
  office: 'Software Engineering Department',
  officeHours: 'Contact the instructor for availability',
  description: """Advanced Mobile Programming introduces the design and implementation of modern cross-platform mobile applications. Throughout the course, students work with Dart and Flutter to build interfaces that are not only functional but also clear, accessible, and responsive on a variety of screen sizes.

The course begins with Flutter architecture, widget composition, and the fundamentals of the Dart language. Students then explore reusable user interface components, layout constraints, event handling, navigation between screens, themes, and animations. The emphasis is on understanding how individual widgets work together to create a complete mobile experience.

Practical exercises encourage students to build applications incrementally, organize source code into maintainable files, and test their work on multiple devices. By the end of the course, students should be comfortable creating layouts, responding to user interactions, and structuring mobile applications so they can grow beyond a single demonstration screen.""",
  objectives: <String>[
    'Compose responsive pages with Flutter widgets and layout constraints.',
    'Use Dart classes, collections and functions in application code.',
    'Handle touch gestures, application state and screen navigation.',
    'Apply consistent styling and meaningful UI animation.',
  ],
  topics: <String>[
    'Flutter foundations',
    'Dart essentials',
    'Layout and widgets',
    'Gestures and navigation',
    'Styling and animations',
  ],
);
