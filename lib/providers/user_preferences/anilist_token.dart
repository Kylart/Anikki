import 'package:flutter/foundation.dart';

import 'package:anikki/providers/user_preferences/user_preferences_client.dart';

class AnilistToken extends UserPreference {
  AnilistToken() {
    getPrefs();
  }

  @override
  void load() {
    token = prefs.getString(key);
  }

  @override
  String key = 'user_preferences_anilistAccessToken';

  /// Access token used by the anilist client if any
  String? _token = '';

  String? get token => _token;

  set token(String? token) {
    _token = token;
    notifyListeners();

    if (token == null) {
      prefs.remove(key);
    } else {
      prefs.setString(key, token);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('token', token));
  }
}
