import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/auth.dart';
import 'package:anilist/src/info.dart';
import 'package:anilist/src/list.dart';
import 'package:anilist/src/schedule.dart';

class Anilist extends AnilistClient
    with AnilistAuth, AnilistAiringSchedule, AnilistInfo, AnilistList {
  Anilist({String? accessToken = null}) : _accessToken = accessToken;

  String? _accessToken;

  String? get accessToken => _accessToken;

  set accessToken(String? value) {
    _accessToken = value;
    initClient(headers: getDefaultHeaders(accessToken: value));
  }
}
