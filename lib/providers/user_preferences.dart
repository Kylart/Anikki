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
    localDirectory = prefs.getString('user_preferences_localDirectory') ?? '';
    anilistAccessToken = prefs.getString('user_preferences_anilistAccessToken');
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
  String? _localDirectory = '';

  String? get localDirectory => _localDirectory;

  set localDirectory(String? localDirectory) {
    _localDirectory = localDirectory;
    notifyListeners();

    if (_localDirectory != null) {
      prefs.setString('user_preferences_localDirectory', _localDirectory!);
    }
  }

  /// Access token used by the anilist client if any
  String? _anilistAccessToken = '';

  String? get anilistAccessToken => _anilistAccessToken;

  set anilistAccessToken(String? anilistAccessToken) {
    _anilistAccessToken = anilistAccessToken;
    notifyListeners();

    if (anilistAccessToken == null) {
      prefs.remove('user_preferences_anilistAccessToken');
    } else {
      prefs.setString(
          'user_preferences_anilistAccessToken', anilistAccessToken);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty<bool>('_darkTheme', _darkTheme));
    properties.add(StringProperty('_localDirectory', _localDirectory));
    properties.add(StringProperty('_anilistAccessToken', _anilistAccessToken));
    properties.add(DiagnosticsProperty<SharedPreferences>('prefs', prefs));
  }
}
