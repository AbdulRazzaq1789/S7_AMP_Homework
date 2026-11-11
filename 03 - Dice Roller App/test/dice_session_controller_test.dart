import 'package:flutter_test/flutter_test.dart';
import 'package:week_03_dice_roller_app/controllers/dice_session_controller.dart';
import 'package:week_03_dice_roller_app/models/roll_record.dart';

void main() {
  test('rolls both dice and calculates statistics', () {
    final next = [4, 4, 6, 1].iterator;
    final controller = DiceSessionController(nextFace: () {
      next.moveNext();
      return next.current;
    });
    addTearDown(controller.dispose);

    final first = controller.roll(DiceTarget.both);
    expect(first.left, 4);
    expect(first.right, 4);
    expect(first.total, 8);
    expect(first.isDouble, isTrue);
    expect(controller.rollCount, 1);
    expect(controller.doublesCount, 1);
    expect(controller.bestTotal, 8);

    controller.roll(DiceTarget.both);
    expect(controller.left, 6);
    expect(controller.right, 1);
    expect(controller.rollCount, 2);
    expect(controller.bestTotal, 8);
    expect(controller.doublesCount, 1);
    expect(controller.history.first.total, 7);
  });

  test('single-die roll does not change the other die', () {
    final controller = DiceSessionController(nextFace: () => 6);
    addTearDown(controller.dispose);
    controller.roll(DiceTarget.left);
    expect(controller.left, 6);
    expect(controller.right, 5);
    expect(controller.history.single.target, DiceTarget.left);
  });

  test('clear history resets stats but not displayed dice', () {
    final controller = DiceSessionController(nextFace: () => 3);
    addTearDown(controller.dispose);
    controller.roll(DiceTarget.both);
    controller.clearHistory();
    expect(controller.rollCount, 0);
    expect(controller.bestTotal, 0);
    expect(controller.left, 3);
    expect(controller.right, 3);
  });

  test('rejects impossible die faces from a generator', () {
    final controller = DiceSessionController(nextFace: () => 8);
    addTearDown(controller.dispose);
    expect(() => controller.roll(DiceTarget.right), throwsStateError);
  });
}
