import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_04_xylophone_app/app.dart';

import 'support/fake_note_audio.dart';

void main() {
  testWidgets('renders seven playable notes and tracks interaction', (tester) async {
    final audio = FakeNoteAudio();
    await tester.pumpWidget(XylophoneApp(audio: audio));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('note-c4')), findsOneWidget);
    expect(find.byKey(const Key('note-b4')), findsOneWidget);
    expect(find.text('0 taps'), findsOneWidget);
    await tester.tap(find.byKey(const Key('note-c4')));
    await tester.pumpAndSettle();
    expect(audio.played, contains('c4'));
    expect(find.text('1 taps'), findsOneWidget);
  });

  testWidgets('mute disables audio playback', (tester) async {
    final audio = FakeNoteAudio();
    await tester.pumpWidget(XylophoneApp(audio: audio));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('mute-button')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('note-d4')));
    await tester.pumpAndSettle();
    expect(audio.played, isEmpty);
  });
}
