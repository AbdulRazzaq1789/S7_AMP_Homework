import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_09_student_profile_dashboard/app.dart';
import 'package:week_09_student_profile_dashboard/screens/student_dashboard_screen.dart';

void main() {
  testWidgets('dashboard renders the required cards and theme toggle', (tester) async {
    await tester.pumpWidget(const StudentDashboardApp(useCustomFont: false));

    expect(find.text('Amina Rahimi'), findsOneWidget);
    expect(find.byKey(const Key('dashboard-title')), findsOneWidget);
    expect(find.byType(Card), findsAtLeastNWidgets(3));

    await tester.tap(find.byKey(const Key('theme-toggle')));
    await tester.pumpAndSettle();
    final element = tester.element(find.byType(StudentDashboardScreen));
    expect(Theme.of(element).brightness, Brightness.dark);
  });

  testWidgets('the student details page opens and can return', (tester) async {
    await tester.pumpWidget(const StudentDashboardApp(useCustomFont: false));
    await tester.ensureVisible(find.byKey(const Key('open-profile-details')));
    await tester.tap(find.byKey(const Key('open-profile-details')));
    await tester.pumpAndSettle();
    expect(find.text('About Amina'), findsOneWidget);
    expect(find.text('Student details'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('My dashboard'), findsOneWidget);
  });
}
