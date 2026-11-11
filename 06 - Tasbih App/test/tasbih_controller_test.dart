import 'package:flutter_test/flutter_test.dart';
import 'package:week_06_tasbih_app/state/tasbih_controller.dart';
import 'package:week_06_tasbih_app/models/tasbih_data.dart';

import 'support/in_memory_tasbih_store.dart';

void main() {
  test('counting completes the target and next tap starts a new round', () async {
    final controller = TasbihController(store: InMemoryTasbihStore());
    await controller.load();
    for (var tap = 1; tap < 33; tap++) {
      expect(controller.increment(), false);
    }
    expect(controller.increment(), true);
    expect(controller.data.current.count, 33);
    expect(controller.data.current.completedRounds, 1);
    expect(controller.data.totalTaps, 33);
    expect(controller.increment(), false);
    expect(controller.data.current.count, 1);
    expect(controller.data.totalTaps, 34);
    expect(controller.data.current.completedRounds, 1);
    await controller.flush();
    controller.dispose();
  });

  test('undo restores last tap and also restores a reset round', () async {
    final controller = TasbihController(store: InMemoryTasbihStore());
    await controller.load();
    controller.increment();
    controller.increment();
    expect(controller.undo(), true);
    expect(controller.data.current.count, 1);
    expect(controller.data.totalTaps, 1);
    controller.resetRound();
    expect(controller.data.current.count, 0);
    expect(controller.undo(), true);
    expect(controller.data.current.count, 1);
    expect(controller.data.totalTaps, 1);
    await controller.flush();
    controller.dispose();
  });

  test('each phrase keeps its count and persistence survives reopening', () async {
    final store = InMemoryTasbihStore();
    final first = TasbihController(store: store);
    await first.load();
    first.increment();
    first.selectDhikr('alhamdulillah');
    first.increment();
    first.increment();
    first.setGoal(99);
    first.increment();
    first.setHapticsEnabled(false);
    await first.flush();
    first.dispose();

    final reopened = TasbihController(store: store);
    await reopened.load();
    expect(reopened.data.forDhikr('subhanallah').count, 1);
    expect(reopened.data.forDhikr('alhamdulillah').count, 1);
    expect(reopened.data.forDhikr('alhamdulillah').goal, 99);
    expect(reopened.data.totalTaps, 4);
    expect(reopened.data.hapticsEnabled, false);
    expect(reopened.data.activeDhikrId, 'alhamdulillah');
    reopened.dispose();
  });

  test('invalid persisted values fall back safely', () {
    final result = const <String, dynamic>{
      'activeDhikrId': 'not-valid',
      'hapticsEnabled': 'no',
      'progress': <String, dynamic>{
        'subhanallah': {'count': 50000, 'goal': 33, 'completedRounds': -5},
      },
    };
    final restored = TasbihData.fromJson(result);
    expect(restored.activeDhikrId, 'subhanallah');
    expect(restored.hapticsEnabled, true);
    expect(restored.current.count, 33);
    expect(restored.current.completedRounds, 0);
  });
}
