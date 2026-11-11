import 'package:flutter/material.dart';

import 'app.dart';
import 'services/shared_preferences_tasbih_store.dart';
import 'state/tasbih_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TasbihApp(
    controller: TasbihController(store: SharedPreferencesTasbihStore()),
  ));
}
