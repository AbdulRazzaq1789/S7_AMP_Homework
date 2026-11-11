import 'dart:math';

import 'package:flutter/foundation.dart';

import '../models/roll_record.dart';

typedef NextFace = int Function();

/// Holds game data independently of presentation/animation.
/// One generated face is requested per die actually rolled.
class DiceSessionController extends ChangeNotifier {
  DiceSessionController({NextFace? nextFace})
      : _nextFace = nextFace ?? _randomFace;

  static final Random _random = Random();
  static int _randomFace() => _random.nextInt(6) + 1;

  final NextFace _nextFace;
  final List<RollRecord> _history = [];

  int _left = 2;
  int _right = 5;

  int get left => _left;
  int get right => _right;
  int get total => _left + _right;
  int get rollCount => _history.length;
  int get doublesCount => _history.where((r) => r.isDouble).length;
  int get bestTotal => _history.isEmpty
      ? 0
      : _history.map((r) => r.total).reduce(max);
  RollRecord? get lastRoll => _history.isEmpty ? null : _history.first;
  List<RollRecord> get history => List.unmodifiable(_history);

  /// Returns the record, so callers/tests can inspect the result.
  RollRecord roll(DiceTarget target) {
    // Generate both values first so a bad generator cannot partially update
    // the session when the request targets both dice.
    var nextLeft = _left;
    var nextRight = _right;
    if (target == DiceTarget.left || target == DiceTarget.both) {
      nextLeft = _validatedFace();
    }
    if (target == DiceTarget.right || target == DiceTarget.both) {
      nextRight = _validatedFace();
    }
    _left = nextLeft;
    _right = nextRight;
    final record = RollRecord(
      left: _left,
      right: _right,
      target: target,
      createdAt: DateTime.now(),
    );
    _history.insert(0, record);
    notifyListeners();
    return record;
  }

  int _validatedFace() {
    final face = _nextFace();
    if (face < 1 || face > 6) {
      throw StateError('A die must return a value from 1 to 6.');
    }
    return face;
  }

  /// Reset statistics and history, leaving the two visible dice intact.
  void clearHistory() {
    if (_history.isEmpty) return;
    _history.clear();
    notifyListeners();
  }
}
