import 'package:anikki/core/providers/anilist/schedule.dart';
import 'package:anikki/core/providers/anilist/anilist_client.dart';
import 'package:anikki/core/providers/anilist/auth.dart';
import 'package:anikki/core/providers/anilist/info.dart';
import 'package:anikki/core/providers/anilist/list.dart';
import 'package:anikki/core/providers/anilist/search.dart';

export 'models/models.dart';
export 'exceptions/exceptions.dart';
export 'anilist.dart';

class Anilist extends AnilistClient
    with AnilistAuth, AnilistInfo, AnilistList, AnilistSearch, AnilistSchedule {
  Anilist({required super.client});
}
