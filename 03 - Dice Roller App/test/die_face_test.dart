import 'package:flutter_test/flutter_test.dart';
import 'package:week_03_dice_roller_app/widgets/die_face.dart';

void main() {
  test('each die face has the correct number of pips', () {
    for (var face = 1; face <= 6; face++) {
      expect(DiePipsPainter.positionsFor(face).length, face);
      for (final position in DiePipsPainter.positionsFor(face)) {
        expect(position.dx, inInclusiveRange(0, 1));
        expect(position.dy, inInclusiveRange(0, 1));
      }
    }
  });

  test('invalid face numbers are rejected', () {
    expect(() => DiePipsPainter.positionsFor(0), throwsArgumentError);
    expect(() => DiePipsPainter.positionsFor(7), throwsArgumentError);
  });
}
