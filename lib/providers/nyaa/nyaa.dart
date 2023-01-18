import 'package:flutter/foundation.dart';

import 'package:kawanime/helpers/hash.dart';
import 'package:kawanime/helpers/parse.dart';
import 'package:kawanime/providers/anilist/standalone.dart';
import 'package:kawanime/providers/anilist/types/media/media.dart';
import 'package:kawanime/providers/nyaa/standalone.dart';
import 'package:kawanime/providers/nyaa/types/main.dart';

class NyaaStore with ChangeNotifier, DiagnosticableTreeMixin {
  NyaaStore() {
    search();
  }

  NyaaStandalone nyaa = NyaaStandalone();
  final AnilistStandalone anilist = AnilistStandalone();

  String fansub = 'SubsPlease';
  String quality = '720p';
  String term = '';

  bool isSearching = true;

  List<Torrent> latestReleases = [];

  bool get hasReleases => latestReleases.isNotEmpty;

  Future<void> search() async {
    isSearching = true;

    notifyListeners();

    latestReleases = await nyaa.search(term: '[$fansub] $term + $quality');

    final List<String> names = latestReleases
        .map((release) => getShortName(name: release.name))
        .toSet()
        .toList();

    Map<String, Media> info = await anilist.info.fromMultiple(names);

    latestReleases = latestReleases.map((release) {
      final String id = getId(name: getShortName(name: release.name));

      if (info.containsKey(id)) {
        release.anilistInfo = info[id];
      }

      return release;
    }).toList();

    isSearching = false;

    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(StringProperty('quality', quality));
    properties.add(StringProperty('fansub', fansub));
    properties.add(StringProperty('term', term));
    properties.add(IterableProperty<Torrent>('latestReleases', latestReleases));
  }
}
