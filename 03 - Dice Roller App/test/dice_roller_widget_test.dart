import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_03_dice_roller_app/app.dart';

void main() {
  testWidgets('roll button records a roll and displays history', (tester) async {
    await tester.pumpWidget(const DiceRollerApp());
    expect(find.text('Roll both dice'), findsOneWidget);
    expect(find.text('No rolls yet. Give the dice a try!'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('roll_both_button')));
    await tester.tap(find.byKey(const Key('roll_both_button')));
    await tester.pumpAndSettle();

    final count = tester.widget<Text>(find.byKey(const Key('stat_roll_count')));
    expect(count.data, '1');
    expect(find.text('No rolls yet. Give the dice a try!'), findsNothing);
  });

  testWidgets('theme toggle changes the theme', (tester) async {
    await tester.pumpWidget(const DiceRollerApp());
    final first = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(first.themeMode, ThemeMode.light);

    await tester.tap(find.byKey(const Key('theme_toggle')));
    await tester.pumpAndSettle();

    final second = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(second.themeMode, ThemeMode.dark);
  });
}
