import 'package:flutter/foundation.dart';

import 'package:graphql/client.dart';

import 'package:kawanime/providers/anilist/info.dart';
import 'package:kawanime/providers/anilist/schedule.dart';
import 'package:kawanime/providers/anilist/standalone.dart';
import 'package:kawanime/providers/anilist/trendings.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class AnilistStore with ChangeNotifier, DiagnosticableTreeMixin {
  late GraphQLClient client;
  late AnilistTrendings trendings;
  late AnilistAiringSchedule airingSchedule;
  late AnilistInfo info;

  AnilistStore() {
    init();
  }

  Future<void> init() async {
    final AnilistStandalone anilist = AnilistStandalone();

    airingSchedule = anilist.airingSchedule;
    trendings = anilist.trendings;
    info = anilist.info;

    await airingSchedule.getEntriesForDate(DateTime.now());
    notifyListeners();
  }
}
