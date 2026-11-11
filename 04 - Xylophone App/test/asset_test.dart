import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_04_xylophone_app/data/notes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('all seven bundled WAV note files have RIFF headers', () async {
    for (final note in kNotes) {
      final data = await rootBundle.load('assets/${note.assetPath}');
      expect(data.lengthInBytes, greaterThan(44));
      final header = data.buffer.asUint8List(0, 4);
      expect(ascii.decode(header), 'RIFF');
    }
  });
}
