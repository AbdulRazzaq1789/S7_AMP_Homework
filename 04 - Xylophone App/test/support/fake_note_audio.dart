import 'package:week_04_xylophone_app/models/musical_note.dart';
import 'package:week_04_xylophone_app/services/note_audio.dart';

class FakeNoteAudio implements NoteAudio {
  final List<String> played = [];
  bool initialized = false;
  bool disposed = false;

  @override
  Future<void> initialize() async { initialized = true; }

  @override
  Future<void> play(MusicalNote note, {double volume = 1.0}) async {
    played.add(note.id);
  }

  @override
  Future<void> dispose() async { disposed = true; }
}
