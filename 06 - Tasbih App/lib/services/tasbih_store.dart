import '../models/tasbih_data.dart';

abstract class TasbihStore {
  Future<TasbihData?> load();
  Future<void> save(TasbihData data);
}
