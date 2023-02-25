import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:anikki/helpers/errors/anilist_get_list_exception.dart';
import 'package:anikki/providers/anilist/list.dart';
import 'package:anikki/providers/anilist/anilist_client.dart';
import 'package:anikki/helpers/errors/anilist_not_connected_exception.dart';
import 'package:anikki/providers/anilist/types/anilist_user/anilist_user.dart';
import 'package:anikki/providers/anilist/auth.dart';
import 'package:anikki/helpers/mixins/loading.dart';
import 'package:anikki/providers/anilist/info.dart';
import 'package:anikki/providers/anilist/schedule.dart';
import 'package:anikki/providers/anilist/types/schedule_entry.dart';

class AnilistStore extends AnilistClient
    with
        ChangeNotifier,
        LoadingMixin,
        AnilistAuth,
        AnilistAiringSchedule,
        AnilistInfo,
        AnilistList {
  List<ScheduleEntry> currentNews = [];
  String? newsError;
  AnilistUser? me;

  bool get isConnected => me != null;

  DateTimeRange currentRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 1)),
    end: DateTime.now().add(const Duration(days: 1)),
  );

  AnilistStore() {
    init();
  }

  Future<void> init() async {
    // Retrieve previous token if any
    final prefs = await SharedPreferences.getInstance();
    final anilistAccessToken =
        prefs.getString('user_preferences_anilistAccessToken');

    await setupClient(
      headers: anilistAccessToken != null
          ? getDefaultHeaders(accessToken: anilistAccessToken)
          : null,
    );

    await getNews(currentRange);
    notifyListeners();
  }

  Future<void> setupClient({Map<String, String>? headers}) async {
    initClient(headers: headers);

    if (headers?['Authorization'] == null) return;

    try {
      me = await getMe();
      notifyListeners();

      if (me?.name != null) {
        getWatchLists(me!.name)
          .catchError((e) {
            if (e is AnilistGetListException) watchListLoadError = e;
            throw e;
          });
      }
    } on AnilistNotConnectedException {
      /// User is not logged in anymore and needs to log in again
      await logout();
    }
  }

  Future<void> logout() async {
    /// Remove the stored token
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_preferences_anilistAccessToken');

    /// Remove the current user. Will set isConnected to false
    me = null;
  }

  Future<void> getNews(DateTimeRange dateRange) async {
    try {
      int currentPage = 1;
      isLoading = true;
      currentNews = [];

      while (true) {
        final page = await getScheduleAtPage(currentPage, dateRange);

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
