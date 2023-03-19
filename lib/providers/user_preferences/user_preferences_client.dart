import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserPreference with ChangeNotifier, DiagnosticableTreeMixin {
  UserPreference () {
    getPrefs();
  }
  
  late SharedPreferences prefs;

  abstract String key;

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    load();
  }

  void load();
}
