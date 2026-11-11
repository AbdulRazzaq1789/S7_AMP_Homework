import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_05_course_detail_screen/app.dart';

void main() {
  testWidgets('shows the course information and sections', (tester) async {
    await tester.pumpWidget(const CourseDetailApp());
    expect(find.text('Advanced Mobile Programming'), findsOneWidget);
    expect(find.textContaining('CS.SE.0731', findRichText: true), findsOneWidget);
    expect(find.text('At a glance'), findsOneWidget);
    expect(find.text('About this course'), findsOneWidget);
  });

  testWidgets('save course button changes state', (tester) async {
    await tester.pumpWidget(const CourseDetailApp());
    await tester.tap(find.widgetWithText(OutlinedButton, 'Save course'));
    await tester.pump();
    expect(find.widgetWithText(OutlinedButton, 'Saved'), findsOneWidget);
  });

  for (final width in <double>[360, 430, 1024]) {
    testWidgets('no immediate layout exception at width $width', (tester) async {
      await tester.binding.setSurfaceSize(Size(width, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(const CourseDetailApp());
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
}
