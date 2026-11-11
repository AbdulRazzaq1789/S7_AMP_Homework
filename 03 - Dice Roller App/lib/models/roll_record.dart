enum DiceTarget { both, left, right }

class RollRecord {
  const RollRecord({
    required this.left,
    required this.right,
    required this.target,
    required this.createdAt,
  });

  final int left;
  final int right;
  final DiceTarget target;
  final DateTime createdAt;

  int get total => left + right;
  bool get isDouble => left == right;

  String get actionLabel => switch (target) {
        DiceTarget.both => 'Both dice',
        DiceTarget.left => 'Left die',
        DiceTarget.right => 'Right die',
      };
}
