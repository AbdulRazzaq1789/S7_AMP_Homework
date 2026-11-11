import 'dhikr.dart';

class DhikrProgress {
  const DhikrProgress({
    this.count = 0,
    this.goal = 33,
    this.lifetimeTaps = 0,
    this.completedRounds = 0,
  });

  final int count;
  final int goal;
  final int lifetimeTaps;
  final int completedRounds;

  double get fraction => goal == 0 ? 0 : count / goal;
  bool get isComplete => count == goal;

  DhikrProgress copyWith({
    int? count,
    int? goal,
    int? lifetimeTaps,
    int? completedRounds,
  }) => DhikrProgress(
    count: count ?? this.count,
    goal: goal ?? this.goal,
    lifetimeTaps: lifetimeTaps ?? this.lifetimeTaps,
    completedRounds: completedRounds ?? this.completedRounds,
  );

  Map<String, Object> toJson() => {
    'count': count,
    'goal': goal,
    'lifetimeTaps': lifetimeTaps,
    'completedRounds': completedRounds,
  };

  factory DhikrProgress.fromJson(Map<String, dynamic> json) {
    int safeInt(String key, int defaultValue) {
      final value = json[key];
      return value is int && value >= 0 ? value : defaultValue;
    }
    final goal = safeInt('goal', 33);
    final safeGoal = TasbihData.goals.contains(goal) ? goal : 33;
    return DhikrProgress(
      goal: safeGoal,
      count: safeInt('count', 0).clamp(0, safeGoal).toInt(),
      lifetimeTaps: safeInt('lifetimeTaps', 0),
      completedRounds: safeInt('completedRounds', 0),
    );
  }
}

class TasbihData {
  const TasbihData({
    required this.activeDhikrId,
    required this.progress,
    required this.hapticsEnabled,
  });

  static const goals = [33, 99, 100, 1000];

  final String activeDhikrId;
  final Map<String, DhikrProgress> progress;
  final bool hapticsEnabled;

  factory TasbihData.initial() => TasbihData(
    activeDhikrId: DhikrCatalog.items.first.id,
    progress: {
      for (final dhikr in DhikrCatalog.items) dhikr.id: const DhikrProgress(),
    },
    hapticsEnabled: true,
  );

  Dhikr get activeDhikr => DhikrCatalog.byId(activeDhikrId);
  DhikrProgress get current => progress[activeDhikrId] ?? const DhikrProgress();
  DhikrProgress forDhikr(String id) => progress[id] ?? const DhikrProgress();
  int get totalTaps => progress.values.fold(0, (sum, p) => sum + p.lifetimeTaps);
  int get totalRounds => progress.values.fold(0, (sum, p) => sum + p.completedRounds);

  TasbihData copyWith({
    String? activeDhikrId,
    Map<String, DhikrProgress>? progress,
    bool? hapticsEnabled,
  }) => TasbihData(
    activeDhikrId: activeDhikrId ?? this.activeDhikrId,
    progress: progress ?? this.progress,
    hapticsEnabled: hapticsEnabled ?? this.hapticsEnabled,
  );

  TasbihData withProgress(String id, DhikrProgress updated) => copyWith(
    progress: { ...progress, id: updated },
  );

  Map<String, Object> toJson() => {
    'schema': 1,
    'activeDhikrId': activeDhikrId,
    'hapticsEnabled': hapticsEnabled,
    'progress': progress.map((id, value) => MapEntry(id, value.toJson())),
  };

  factory TasbihData.fromJson(Map<String, dynamic> json) {
    final defaults = TasbihData.initial();
    final saved = json['progress'];
    final values = <String, DhikrProgress>{...defaults.progress};
    if (saved is Map) {
      for (final dhikr in DhikrCatalog.items) {
        final item = saved[dhikr.id];
        if (item is Map) {
          values[dhikr.id] = DhikrProgress.fromJson(
            Map<String, dynamic>.from(item),
          );
        }
      }
    }
    final id = json['activeDhikrId'];
    return TasbihData(
      activeDhikrId: id is String && DhikrCatalog.contains(id)
        ? id : defaults.activeDhikrId,
      progress: values,
      hapticsEnabled: json['hapticsEnabled'] is bool
        ? json['hapticsEnabled'] as bool : true,
    );
  }
}
