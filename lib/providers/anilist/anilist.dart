import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:graphql/client.dart';
import 'package:kawanime/helpers/mixins/loading.dart';

import 'package:kawanime/providers/anilist/info.dart';
import 'package:kawanime/providers/anilist/schedule.dart';
import 'package:kawanime/providers/anilist/standalone.dart';
import 'package:kawanime/providers/anilist/trendings.dart';
import 'package:kawanime/providers/anilist/types/schedule_entry.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class AnilistStore with ChangeNotifier, DiagnosticableTreeMixin, LoadingMixin {
  late GraphQLClient client;
  late AnilistTrendings trendings;
  late AnilistAiringSchedule airingSchedule;
  late AnilistInfo info;

  List<ScheduleEntry> currentNews = [];
  String? newsError;

  DateTimeRange currentRange = DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 3)),
        end: DateTime.now().add(const Duration(days: 2)),
      );

  AnilistStore() {
    init();
  }

  Future<void> init() async {
    final AnilistStandalone anilist = AnilistStandalone();

    airingSchedule = anilist.airingSchedule;
    trendings = anilist.trendings;
    info = anilist.info;

    await getNews(currentRange);
    notifyListeners();
  }

  Future<void> getNews (DateTimeRange dateRange) async {
    try {
      int currentPage = 1;
      isLoading = true;
      currentNews = [];

      while (true) {
        final page = await airingSchedule.getScheduleAtPage(currentPage, dateRange);

        if (page == null) break;

        currentPage++;

        currentNews.addAll(page.airingSchedules);
      }

      newsError = null;
      isLoading = false;
    } catch (e) {
      newsError = e.toString();
      notifyListeners();
    }
  }
}
