import 'package:week_06_tasbih_app/models/tasbih_data.dart';
import 'package:week_06_tasbih_app/services/tasbih_store.dart';

class InMemoryTasbihStore implements TasbihStore {
  TasbihData? saved;
  int writes = 0;

  @override
  Future<TasbihData?> load() async => saved;

  @override
  Future<void> save(TasbihData data) async {
    saved = TasbihData.fromJson(data.toJson());
    writes++;
  }
}
