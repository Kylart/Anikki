import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences with ChangeNotifier, DiagnosticableTreeMixin {
  UserPreferences() {
    _loadPrefs();
  }

  late SharedPreferences prefs;

  Future<void> _loadPrefs() async {
    prefs = await SharedPreferences.getInstance();

    darkTheme = prefs.getBool('user_preferences_darkTheme') ?? true;
    localDirecotry = prefs.getString('user_preferences_localDirectory') ?? '';
  }

  /// Whether dark theme is enabled or not
  bool _darkTheme = true;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool darkTheme) {
    _darkTheme = darkTheme;
    notifyListeners();

    prefs.setBool('user_preferences_darkTheme', _darkTheme);
  }

  /// Directory where local files should be looked for on application startup
  String _localDirectory = '';

  String get localDirecotry => _localDirectory;

  set localDirecotry(String localDirecotry) {
    _localDirectory = localDirecotry;
    notifyListeners();

    prefs.setString('user_preferences_localDirectory', _localDirectory);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty<bool>('_darkTheme', _darkTheme));
    properties.add(DiagnosticsProperty<bool>('_localDirectory', _darkTheme));
    properties.add(DiagnosticsProperty<SharedPreferences>('prefs', prefs));
  }
}
