import 'package:flutter/foundation.dart';

import 'package:anikki/providers/user_preferences/user_preferences_client.dart';

class LocalDirectory extends UserPreference {
  @override
  void load() {
    path = prefs.getString(key) ?? '';
  }

  @override
  String key = 'user_preferences_localDirectory';

  /// Access token used by the anilist client if any
  String _path = '';

  String get path => _path;

  set path(String path) {
    _path = path;
    notifyListeners();

    prefs.setString(key, path);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('path', path));
  }
}
