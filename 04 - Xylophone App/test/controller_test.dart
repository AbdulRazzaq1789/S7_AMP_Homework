import 'package:flutter_test/flutter_test.dart';
import 'package:week_04_xylophone_app/controllers/xylophone_controller.dart';
import 'package:week_04_xylophone_app/data/notes.dart';

import 'support/fake_note_audio.dart';

void main() {
  test('initializes and plays a note', () async {
    final audio = FakeNoteAudio();
    final controller = XylophoneController(audio);
    await controller.initialize();
    expect(controller.isReady, isTrue);
    await controller.playNote(kNotes.first);
    expect(audio.played, ['c4']);
    expect(controller.lastNote?.label, 'C4');
    expect(controller.playCount, 1);
    expect(controller.recentNotes, hasLength(1));
    controller.dispose();
  });

  test('mute prevents playback while keeping visual feedback', () async {
    final audio = FakeNoteAudio();
    final controller = XylophoneController(audio);
    await controller.initialize();
    controller.toggleMute();
    await controller.playNote(kNotes[2]);
    expect(audio.played, isEmpty);
    expect(controller.isMuted, isTrue);
    expect(controller.lastNote?.label, 'E4');
    controller.dispose();
  });

  test('recent history is capped at eight and can be cleared', () async {
    final controller = XylophoneController(FakeNoteAudio());
    await controller.initialize();
    for (var i = 0; i < 12; i++) { await controller.playNote(kNotes[i % kNotes.length]); }
    expect(controller.recentNotes, hasLength(8));
    controller.clearHistory();
    expect(controller.playCount, 0);
    expect(controller.recentNotes, isEmpty);
    controller.dispose();
  });
}
