import 'package:flutter/foundation.dart';

import 'package:anikki/providers/user_preferences/user_preferences_client.dart';

class DarkTheme extends UserPreference {
  DarkTheme() {
    getPrefs();
  }

  @override
  void load() {
    active = prefs.getBool(key) ?? true;
  }

  @override
  String key = 'user_preferences_darkTheme';

  /// Access token used by the anilist client if any
  bool _active = true;

  bool get active => _active;

  set active(bool active) {
    _active = active;
    notifyListeners();

    prefs.setBool(key, active);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('active', active));
  }
}
