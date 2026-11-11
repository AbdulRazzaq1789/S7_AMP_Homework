import 'package:audioplayers/audioplayers.dart';

import '../data/notes.dart';
import '../models/musical_note.dart';

/// A small boundary between the UI and platform audio for testability.
abstract class NoteAudio {
  Future<void> initialize();
  Future<void> play(MusicalNote note, {double volume = 1.0});
  Future<void> dispose();
}

/// Preloads a short sample pool for each note to minimize tapping latency.
/// Multiple note pools allow different notes to ring at the same time.
class BundledNoteAudio implements NoteAudio {
  final Map<String, AudioPool> _pools = {};

  @override
  Future<void> initialize() async {
    try {
      for (final note in kNotes) {
        if (_pools.containsKey(note.id)) continue;
        _pools[note.id] = await AudioPool.createFromAsset(
          path: note.assetPath,
          minPlayers: 1,
          maxPlayers: 3,
        );
      }
    } catch (_) {
      await dispose();
      rethrow;
    }
  }

  @override
  Future<void> play(MusicalNote note, {double volume = 1.0}) async {
    final pool = _pools[note.id];
    if (pool == null) {
      throw StateError('Audio is not ready for ${note.label}');
    }
    await pool.start(volume: volume);
  }

  @override
  Future<void> dispose() async {
    final pools = _pools.values.toList();
    _pools.clear();
    for (final pool in pools) {
      await pool.dispose();
    }
  }
}
