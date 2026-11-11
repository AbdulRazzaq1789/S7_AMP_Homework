import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/tasbih_data.dart';
import 'tasbih_store.dart';

class SharedPreferencesTasbihStore implements TasbihStore {
  static const storageKey = 'week6.tasbih.progress.v1';

  @override
  Future<TasbihData?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(storageKey);
    if (saved == null) return null;
    try {
      final decoded = jsonDecode(saved);
      if (decoded is! Map<String, dynamic>) return null;
      return TasbihData.fromJson(decoded);
    } on FormatException {
      // An invalid local record should not prevent the app from opening.
      return null;
    } on TypeError {
      return null;
    }
  }

  @override
  Future<void> save(TasbihData data) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = await prefs.setString(storageKey, jsonEncode(data.toJson()));
    if (!saved) throw StateError('Unable to save Tasbih progress');
  }
}
