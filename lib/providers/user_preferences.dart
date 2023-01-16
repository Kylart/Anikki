import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences with ChangeNotifier, DiagnosticableTreeMixin {
  UserPreferences() {
    _loadPrefs();
  }

  /// Whether dark theme is enabled or not
  bool _darkTheme = true;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool darkTheme) {
    _darkTheme = darkTheme;
    notifyListeners();

    prefs.setBool('user_preferences_darkTheme', _darkTheme);
  }

  late SharedPreferences prefs;

  Future<void> _loadPrefs() async {
    prefs = await SharedPreferences.getInstance();

    darkTheme = prefs.getBool('user_preferences_darkTheme') ?? true;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty<bool>('_darkTheme', _darkTheme));
    properties.add(DiagnosticsProperty<SharedPreferences>('prefs', prefs));
  }
}
