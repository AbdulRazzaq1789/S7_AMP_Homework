import 'dart:async';

import 'package:flutter/foundation.dart';

import '../data/notes.dart';
import '../models/musical_note.dart';
import '../services/note_audio.dart';

class XylophoneController extends ChangeNotifier {
  XylophoneController(this._audio);

  final NoteAudio _audio;
  bool _disposed = false;
  bool _isReady = false;
  bool _isDemoPlaying = false;
  bool _isMuted = false;
  String? _error;
  MusicalNote? _lastNote;
  int _playCount = 0;
  final List<MusicalNote> _recentNotes = [];
  int _demoRun = 0;

  bool get isReady => _isReady;
  bool get isDemoPlaying => _isDemoPlaying;
  bool get isMuted => _isMuted;
  String? get error => _error;
  MusicalNote? get lastNote => _lastNote;
  int get playCount => _playCount;
  List<MusicalNote> get recentNotes => List.unmodifiable(_recentNotes);

  Future<void> initialize() async {
    if (_isReady) return;
    _error = null;
    _notify();
    try {
      await _audio.initialize();
      if (_disposed) return;
      _isReady = true;
    } catch (_) {
      if (_disposed) return;
      _error = 'Could not load the audio samples. Check the bundled assets and try again.';
    }
    _notify();
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    _notify();
  }

  Future<void> playNote(MusicalNote note) async {
    if (!_isReady || _disposed) return;
    _lastNote = note;
    _playCount += 1;
    _recentNotes.insert(0, note);
    if (_recentNotes.length > 8) _recentNotes.removeLast();
    _notify();
    if (_isMuted) return;

    try {
      await _audio.play(note);
    } catch (_) {
      if (_disposed) return;
      _error = 'Sound playback failed. Please check device audio settings.';
      _notify();
    }
  }

  Future<void> playScale() async {
    if (!_isReady || _isDemoPlaying || _disposed) return;
    _isDemoPlaying = true;
    final run = ++_demoRun;
    _notify();
    try {
      for (final note in kNotes) {
        if (_disposed || run != _demoRun) break;
        await playNote(note);
        await Future<void>.delayed(const Duration(milliseconds: 410));
      }
    } finally {
      if (!_disposed && run == _demoRun) {
        _isDemoPlaying = false;
        _notify();
      }
    }
  }

  void stopScale() {
    if (!_isDemoPlaying) return;
    _demoRun += 1;
    _isDemoPlaying = false;
    _notify();
  }

  void clearHistory() {
    _recentNotes.clear();
    _lastNote = null;
    _playCount = 0;
    _notify();
  }

  void dismissError() {
    _error = null;
    _notify();
  }

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _demoRun += 1;
    unawaited(_audio.dispose());
    super.dispose();
  }
}
