import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_02_student_profile_application/app.dart';

void main() {
  testWidgets('student profile displays required details and supports interactions', (tester) async {
    await tester.pumpWidget(const StudentProfileApp());
    expect(find.text('Ariana Rahimi'), findsOneWidget);
    expect(find.text('Software Engineering'), findsAtLeastNWidgets(1));
    expect(find.text('Semester 6'), findsOneWidget);
    expect(find.text('Save profile'), findsOneWidget);

    await tester.tap(find.byKey(const Key('save_profile_button')));
    await tester.pump();
    expect(find.text('Saved profile'), findsOneWidget);

    await tester.tap(find.byKey(const Key('theme_toggle_button')));
    await tester.pumpAndSettle();
    final theme = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(theme.themeMode, ThemeMode.dark);
  });
}
