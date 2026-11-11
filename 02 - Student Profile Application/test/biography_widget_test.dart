import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_02_student_profile_application/data/sample_student.dart';
import 'package:week_02_student_profile_application/widgets/biography_card.dart';

void main() {
  testWidgets('Read more reveals extended biography', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: BiographyCard(student: sampleStudent))));
    expect(find.textContaining('My interests include Flutter'), findsNothing);
    await tester.tap(find.byKey(const Key('biography_toggle')));
    await tester.pumpAndSettle();
    expect(find.textContaining('My interests include Flutter'), findsOneWidget);
    expect(find.text('Show less'), findsOneWidget);
  });
}
