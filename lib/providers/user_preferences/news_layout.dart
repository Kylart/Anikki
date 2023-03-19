import 'package:flutter/foundation.dart';

import 'package:anikki/providers/user_preferences/user_preferences_client.dart';

enum NewsLayouts {
  grid,
  list,
}

class NewsLayout extends UserPreference {
  @override
  void load() {
    layout =
        prefs.getString(key) == 'list' ? NewsLayouts.list : NewsLayouts.grid;
  }

  @override
  String key = 'user_preferences_newsLayout';

  NewsLayouts _layout = NewsLayouts.grid;

  NewsLayouts get layout => _layout;

  set layout(NewsLayouts value) {
    _layout = value;
    notifyListeners();

    prefs.setString(key, value.name);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<NewsLayouts>('layout', layout));
  }
}
