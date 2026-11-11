import 'package:flutter/material.dart';

/// One natural note in the C-major scale.
@immutable
class MusicalNote {
  const MusicalNote({
    required this.id,
    required this.label,
    required this.solfege,
    required this.frequencyHz,
    required this.color,
  });

  final String id;
  final String label;
  final String solfege;
  final double frequencyHz;
  final Color color;

  /// The bundled PCM wave file is stored at assets/notes/<id>.wav.
  String get assetPath => 'notes/$id.wav';
}
