import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_01_i_am_rich_app/app.dart';

void main() {
  testWidgets('shows the I Am Rich heading and bundled diamond', (tester) async {
    await tester.pumpWidget(const IAmRichApp());

    expect(find.text('I AM RICH'), findsOneWidget);
    expect(find.text('Confidence is priceless.'), findsOneWidget);
    expect(find.byKey(const Key('diamond-image')), findsOneWidget);
  });

  testWidgets('uses a dark application theme', (tester) async {
    await tester.pumpWidget(const IAmRichApp());

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.theme!.brightness, Brightness.dark);
  });

  testWidgets('fits the headline on a narrow phone viewport', (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const IAmRichApp());
    expect(find.byKey(const Key('rich-title')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
