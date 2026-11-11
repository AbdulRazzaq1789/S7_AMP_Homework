import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_08_course_management_navigation_demo/app.dart';
import 'package:week_08_course_management_navigation_demo/screens/workspace_screen.dart';

Future<void> enterWorkspace(WidgetTester tester) async {
  await tester.pumpWidget(const CourseManagementApp());
  await tester.tap(find.byKey(const Key('enter-workspace')));
  await tester.pumpAndSettle();
}

Future<void> navigateByDrawer(WidgetTester tester, String section) async {
  await tester.tap(find.byTooltip('Open navigation menu'));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key('nav-$section')));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('simulated login uses route replacement', (tester) async {
    await enterWorkspace(tester);
    expect(find.byType(WorkspaceScreen), findsOneWidget);
    expect(find.text('Welcome back, Student!'), findsOneWidget);
    // The login route has been replaced rather than left behind.
    final navigator = Navigator.of(tester.element(find.byType(WorkspaceScreen)));
    expect(navigator.canPop(), isFalse);
  });

  testWidgets('Drawer selects Courses with three tabs', (tester) async {
    await enterWorkspace(tester);
    await navigateByDrawer(tester, 'courses');
    expect(find.text('Course library'), findsOneWidget);
    expect(find.widgetWithText(Tab, 'All courses'), findsOneWidget);
    expect(find.widgetWithText(Tab, 'In progress'), findsOneWidget);
    expect(find.widgetWithText(Tab, 'Completed'), findsOneWidget);
    await tester.tap(find.widgetWithText(Tab, 'Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Computer Networks'), findsOneWidget);
  });

  testWidgets('Course Details sends a typed result back to Courses', (tester) async {
    await enterWorkspace(tester);
    await navigateByDrawer(tester, 'courses');
    await tester.tap(find.byKey(const Key('course-cs-301')));
    await tester.pumpAndSettle();
    expect(find.text('Course information'), findsOneWidget);
    expect(find.text('CS.SE.0731'), findsWidgets);
    expect(find.text('3 credit hours'), findsOneWidget);
    // A completed course moves to the Completed tab after saving.
    await tester.scrollUntilVisible(find.byKey(const Key('complete-toggle')), 250);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('complete-toggle')));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.byKey(const Key('save-course-result')), 250);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('save-course-result')));
    await tester.pumpAndSettle();
    expect(find.text('Course library'), findsOneWidget);
    await tester.tap(find.widgetWithText(Tab, 'Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Mobile Application Development'), findsOneWidget);
  });

  testWidgets('Settings opens named route and clears stack on exit', (tester) async {
    await enterWorkspace(tester);
    await navigateByDrawer(tester, 'settings');
    await tester.tap(find.byKey(const Key('about-named-route')));
    await tester.pumpAndSettle();
    expect(find.text('About this demo'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('log-out')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('enter-workspace')), findsOneWidget);
    final navigator = Navigator.of(tester.element(find.byKey(const Key('enter-workspace'))));
    expect(navigator.canPop(), isFalse);
  });
}
