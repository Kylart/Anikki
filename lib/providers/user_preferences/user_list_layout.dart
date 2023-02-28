import 'package:flutter/foundation.dart';

import 'package:anikki/providers/user_preferences/user_preferences_client.dart';

enum UserListLayouts {
  grid,
  list,
}

class UserListLayout extends UserPreference {
  UserListLayout() {
    getPrefs();
  }

  @override
  void load() {
    layout = prefs.getString(key) == 'list'
        ? UserListLayouts.list
        : UserListLayouts.grid;
  }

  @override
  String key = 'user_preferences_userListLayout';

  UserListLayouts _layout = UserListLayouts.grid;

  UserListLayouts get layout => _layout;

  set layout(UserListLayouts value) {
    _layout = value;
    notifyListeners();

    prefs.setString(key, value.name);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<UserListLayouts>('layout', layout));
  }
}
