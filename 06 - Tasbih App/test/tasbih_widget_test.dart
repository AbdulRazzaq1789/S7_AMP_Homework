import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_06_tasbih_app/app.dart';
import 'package:week_06_tasbih_app/state/tasbih_controller.dart';

import 'support/in_memory_tasbih_store.dart';

void main() {
  testWidgets('counter increments, undo reverses it, and progress is available', (tester) async {
    final controller = TasbihController(store: InMemoryTasbihStore());
    await tester.pumpWidget(TasbihApp(controller: controller));
    await tester.pumpAndSettle();
    expect(controller.data.current.count, 0);

    final counter = find.byKey(const Key('counter_button'));
    await tester.ensureVisible(counter);
    await tester.pumpAndSettle();
    await tester.tap(counter);
    await tester.pumpAndSettle();
    expect(controller.data.current.count, 1);
    expect(find.byKey(const Key('counter_value')), findsOneWidget);

    final undo = find.byKey(const Key('undo_button'));
    await tester.ensureVisible(undo);
    await tester.tap(undo);
    await tester.pumpAndSettle();
    expect(controller.data.current.count, 0);

    await tester.tap(find.byKey(const Key('nav_progress')));
    await tester.pumpAndSettle();
    expect(find.text('Your progress'), findsOneWidget);
  });

  testWidgets('changing phrase retains the previous phrase count', (tester) async {
    final controller = TasbihController(store: InMemoryTasbihStore());
    await tester.pumpWidget(TasbihApp(controller: controller));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('counter_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('counter_button')));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.byKey(const Key('dhikr_alhamdulillah')), -150,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('dhikr_alhamdulillah')));
    await tester.pumpAndSettle();
    expect(controller.data.current.count, 0);
    expect(controller.data.forDhikr('subhanallah').count, 1);
  });
}
