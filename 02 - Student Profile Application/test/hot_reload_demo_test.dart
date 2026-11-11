import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_02_student_profile_application/widgets/hot_reload_demo_card.dart';

void main() {
  testWidgets('counter updates via setState', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: HotReloadDemoCard())));
    expect(find.text('Counter: 0'), findsOneWidget);
    await tester.tap(find.byKey(const Key('hot_reload_increment')));
    await tester.pump();
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
