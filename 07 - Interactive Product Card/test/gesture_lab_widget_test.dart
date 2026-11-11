import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_07_interactive_product_card/app.dart';

void main() {
  testWidgets('product screen shows a visible action and gesture checklist',
      (tester) async {
    await tester.pumpWidget(const GestureLabApp());
    expect(find.text('Make every gesture count.'), findsOneWidget);
    expect(find.byKey(const Key('add_to_bag')), findsOneWidget);
    expect(find.byKey(const Key('completion_count')), findsOneWidget);
  });

  testWidgets('tap expands details and Add to bag updates item count',
      (tester) async {
    await tester.pumpWidget(const GestureLabApp());
    final gesture = find.byKey(const Key('gesture_surface'));
    await tester.ensureVisible(gesture);
    await tester.pumpAndSettle();
    await tester.tapAt(tester.getTopLeft(gesture) + const Offset(70, 100));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('product_details')), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('add_to_bag')));
    await tester.tap(find.byKey(const Key('add_to_bag')));
    await tester.pump();
    expect(tester.widget<Text>(find.byKey(const Key('bag_count'))).data, '1');
  });

  testWidgets('Zoom opens a dedicated InteractiveViewer', (tester) async {
    await tester.pumpWidget(const GestureLabApp());
    await tester.ensureVisible(find.byKey(const Key('open_image_viewer')));
    await tester.tap(find.byKey(const Key('open_image_viewer')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('pinch_image_viewer')), findsOneWidget);
    await tester.tap(find.byKey(const Key('close_image_viewer')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('pinch_image_viewer')), findsNothing);
  });

  testWidgets('double tap favorites, long press opens menu', (tester) async {
    await tester.pumpWidget(const GestureLabApp());
    final gesture = find.byKey(const Key('gesture_surface'));
    final Offset tapPoint = tester.getTopLeft(gesture) + const Offset(115, 100);
    await tester.tapAt(tapPoint);
    await tester.pump(const Duration(milliseconds: 80));
    await tester.tapAt(tapPoint);
    await tester.pumpAndSettle();
    expect(
      tester.widget<Icon>(find.byKey(const Key('favorite_indicator'))).icon,
      Icons.favorite_rounded,
    );

    await tester.longPressAt(tapPoint);
    await tester.pumpAndSettle();
    expect(find.text('Product actions'), findsOneWidget);
    expect(find.text('Save for later'), findsOneWidget);
  });

  testWidgets('short horizontal drag snaps back; intentional swipe archives',
      (tester) async {
    await tester.pumpWidget(const GestureLabApp());
    final gesture = find.byKey(const Key('gesture_surface'));
    final Offset startPoint = tester.getTopLeft(gesture) + const Offset(180, 100);
    await tester.dragFrom(startPoint, const Offset(-55, 0));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('archived_placeholder')), findsNothing);

    await tester.dragFrom(startPoint, const Offset(-160, 0));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('archived_placeholder')), findsOneWidget);
    await tester.ensureVisible(find.byKey(const Key('restore_product')));
    await tester.tap(find.byKey(const Key('restore_product')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('gesture_surface')), findsOneWidget);
  });
}
