import 'package:anikki/helpers/errors/anilist_not_connected_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:anikki/providers/anilist/types/anilist_user/anilist_user.dart';
import 'package:anikki/providers/anilist/auth.dart';
import 'package:anikki/helpers/mixins/loading.dart';
import 'package:anikki/providers/anilist/info.dart';
import 'package:anikki/providers/anilist/schedule.dart';
import 'package:anikki/providers/anilist/standalone.dart';
import 'package:anikki/providers/anilist/types/schedule_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class AnilistStore with ChangeNotifier, DiagnosticableTreeMixin, LoadingMixin {
  late AnilistAiringSchedule airingSchedule;
  late AnilistInfo info;
  late AnilistAuth auth;

  List<ScheduleEntry> currentNews = [];
  String? newsError;
  AnilistUser? me;

  bool get isConnected => me != null;

  DateTimeRange currentRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 3)),
    end: DateTime.now().add(const Duration(days: 2)),
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
    final AnilistStandalone anilist = AnilistStandalone(headers: headers);

    airingSchedule = anilist.airingSchedule;
    info = anilist.info;
    auth = anilist.auth;

    if (headers?['Authorization'] == null) return;

    try {
      me = await auth.getMe();
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

  Map<String, String> getDefaultHeaders({required String accessToken}) {
    return {
      'Authorization': 'Bearer $accessToken',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<void> getNews(DateTimeRange dateRange) async {
    try {
      int currentPage = 1;
      isLoading = true;
      currentNews = [];

      while (true) {
        final page =
            await airingSchedule.getScheduleAtPage(currentPage, dateRange);

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
