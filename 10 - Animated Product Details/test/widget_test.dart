import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_10_animated_product_details/app.dart';

void main() {
  testWidgets('opens a product and toggles favorite', (tester) async {
    await tester.pumpWidget(const AnimatedProductsApp());
    expect(find.text('Find your sound'), findsOneWidget);
    await tester.tap(find.byKey(const Key('open_product_violet')));
    await tester.pumpAndSettle();
    expect(find.text('Product details'), findsOneWidget);
    expect(find.byKey(const Key('favorite_button')), findsOneWidget);
    await tester.tap(find.byKey(const Key('favorite_button')));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Remove favorite'), findsOneWidget);
  });

  testWidgets('expands specifications and shows more information', (tester) async {
    await tester.pumpWidget(const AnimatedProductsApp());
    await tester.tap(find.byKey(const Key('open_product_rose')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('specifications_toggle')));
    await tester.tap(find.byKey(const Key('specifications_toggle')));
    await tester.pumpAndSettle();
    expect(find.text('Bluetooth 5.3'), findsOneWidget);
    await tester.ensureVisible(find.byKey(const Key('more_information_toggle')));
    await tester.tap(find.byKey(const Key('more_information_toggle')));
    await tester.pumpAndSettle();
    expect(find.text('Hide more information'), findsOneWidget);
  });
}
