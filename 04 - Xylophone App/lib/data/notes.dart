import 'package:flutter/material.dart';

import '../models/musical_note.dart';

const List<MusicalNote> kNotes = [
  MusicalNote(id: 'c4', label: 'C4', solfege: 'DO', frequencyHz: 261.63, color: Color(0xFFF16B77)),
  MusicalNote(id: 'd4', label: 'D4', solfege: 'RE', frequencyHz: 293.66, color: Color(0xFFF4A261)),
  MusicalNote(id: 'e4', label: 'E4', solfege: 'MI', frequencyHz: 329.63, color: Color(0xFFF5C66F)),
  MusicalNote(id: 'f4', label: 'F4', solfege: 'FA', frequencyHz: 349.23, color: Color(0xFF81D4A3)),
  MusicalNote(id: 'g4', label: 'G4', solfege: 'SOL', frequencyHz: 392.00, color: Color(0xFF67C9CF)),
  MusicalNote(id: 'a4', label: 'A4', solfege: 'LA', frequencyHz: 440.00, color: Color(0xFF7A9DEF)),
  MusicalNote(id: 'b4', label: 'B4', solfege: 'TI', frequencyHz: 493.88, color: Color(0xFFBB91EE)),
];
