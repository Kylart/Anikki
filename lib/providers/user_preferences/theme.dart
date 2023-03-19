import 'package:flutter/foundation.dart';

import 'package:anikki/providers/user_preferences/user_preferences_client.dart';
import 'package:flutter/material.dart';

class AnikkiTheme extends UserPreference {
  @override
  void load() {
    if (prefs.getInt(key) != null) {
      theme = ThemeMode.values[prefs.getInt(key)!];
    }
  }

  @override
  String key = 'user_preferences_theme';

  /// Access token used by the anilist client if any
  ThemeMode _theme = ThemeMode.system;

  ThemeMode get theme => _theme;

  set theme(ThemeMode theme) {
    _theme = theme;
    notifyListeners();

    prefs.setInt(key, _theme.index);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<ThemeMode>('theme', theme));
  }
}
