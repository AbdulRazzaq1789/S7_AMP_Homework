import 'package:flutter/foundation.dart';

import '../models/dhikr.dart';
import '../models/tasbih_data.dart';
import '../services/tasbih_store.dart';

/// Pure state operations are kept separate from the UI and the storage plugin.
class TasbihController extends ChangeNotifier {
  TasbihController({required TasbihStore store}) : _store = store;

  final TasbihStore _store;
  TasbihData data = TasbihData.initial();
  TasbihData? _undoSnapshot;
  Future<void> _pendingSave = Future<void>.value();
  bool isReady = false;
  String? storageError;

  bool get canUndo => _undoSnapshot != null;

  Future<void> load() async {
    try {
      data = await _store.load() ?? TasbihData.initial();
      storageError = null;
    } catch (_) {
      // The app still works in memory if local storage is inaccessible.
      data = TasbihData.initial();
      storageError = 'Progress could not be loaded from this device.';
    }
    isReady = true;
    notifyListeners();
  }

  /// Returns true precisely when this press completes the selected target.
  bool increment() {
    if (!isReady) return false;
    _undoSnapshot = data;
    final current = data.current;
    final nextCount = current.isComplete ? 1 : current.count + 1;
    final justCompleted = nextCount == current.goal;
    final updated = current.copyWith(
      count: nextCount,
      lifetimeTaps: current.lifetimeTaps + 1,
      completedRounds: current.completedRounds + (justCompleted ? 1 : 0),
    );
    _replace(data.withProgress(data.activeDhikrId, updated));
    return justCompleted;
  }

  bool undo() {
    if (!isReady || _undoSnapshot == null) return false;
    final restored = _undoSnapshot!;
    _undoSnapshot = null;
    _replace(restored);
    return true;
  }

  void selectDhikr(String id) {
    if (!isReady || !DhikrCatalog.contains(id) || data.activeDhikrId == id) return;
    _undoSnapshot = null;
    _replace(data.copyWith(activeDhikrId: id));
  }

  /// Changing a target starts a fresh round, without deleting lifetime totals.
  void setGoal(int goal) {
    if (!isReady || !TasbihData.goals.contains(goal) || data.current.goal == goal) return;
    _undoSnapshot = data;
    _replace(data.withProgress(
      data.activeDhikrId,
      data.current.copyWith(count: 0, goal: goal),
    ));
  }

  void resetRound() {
    if (!isReady || data.current.count == 0) return;
    _undoSnapshot = data;
    _replace(data.withProgress(data.activeDhikrId, data.current.copyWith(count: 0)));
  }

  void setHapticsEnabled(bool enabled) {
    if (!isReady || data.hapticsEnabled == enabled) return;
    _replace(data.copyWith(hapticsEnabled: enabled));
  }

  void _replace(TasbihData next) {
    data = next;
    notifyListeners();
    final snapshot = next;
    // Serialize writes to avoid an older async write overwriting a newer tap.
    _pendingSave = _pendingSave.catchError((Object _) {}).then((_) async {
      try {
        await _store.save(snapshot);
        if (storageError != null) {
          storageError = null;
          notifyListeners();
        }
      } catch (_) {
        storageError = 'Changes could not be saved on this device.';
        notifyListeners();
      }
    });
  }

  Future<void> flush() => _pendingSave;
}
