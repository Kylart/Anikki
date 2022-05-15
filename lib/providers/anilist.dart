import 'package:flutter/foundation.dart';

import 'package:kawanime/services/externals/anilist/main.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class AnilistStore with ChangeNotifier, DiagnosticableTreeMixin {
  AnilistStore() {
    init();
  }

  final Anilist anilist = Anilist();

  Future<void> init() async {
    await anilist.airingSchedule.getEntriesForDate(DateTime.now());
    notifyListeners();
  }
}
