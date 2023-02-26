import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/helpers/mixins/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnilistStore with ChangeNotifier, LoadingMixin {
  AnilistStore() {
    init();
  }

  Anilist provider = Anilist();
  List<ScheduleEntry> currentNews = [];
  AnilistGetScheduleException? newsError;
  AnilistUser? me;

  bool get isConnected => me != null;

  DateTimeRange currentRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 1)),
    end: DateTime.now().add(const Duration(days: 1)),
  );

  bool _isWatchListLoading = false;

  bool get isWatchListLoading => _isWatchListLoading;

  set isWatchListLoading(bool value) {
    _isWatchListLoading = value;
    notifyListeners();
  }

  AnilistGetListException? _watchListLoadError;

  AnilistGetListException? get watchListLoadError => _watchListLoadError;

  set watchListLoadError(AnilistGetListException? value) {
    _watchListLoadError = value;
    notifyListeners();
  }

  Map<AnilistMediaListStatus, List<AnilistListEntry>> watchList = {
    AnilistMediaListStatus.completed: [],
    AnilistMediaListStatus.current: [],
    AnilistMediaListStatus.dropped: [],
    AnilistMediaListStatus.paused: [],
    AnilistMediaListStatus.planning: [],
    AnilistMediaListStatus.repeating: [],
  };

  List<AnilistListEntry> get currentList =>
      watchList[AnilistMediaListStatus.current]!;
  List<AnilistListEntry> get completedList =>
      watchList[AnilistMediaListStatus.completed]!;

  Future<void> init() async {
    // Retrieve previous token if any
    final prefs = await SharedPreferences.getInstance();
    final anilistAccessToken =
        prefs.getString('user_preferences_anilistAccessToken');

    provider = Anilist(accessToken: anilistAccessToken);

    await getNews(currentRange);

    if (anilistAccessToken != null) {
      me = await provider.getMe();
      notifyListeners();

      if (me?.name != null) {
        watchList = await provider.getWatchLists(me!.name);
        notifyListeners();
      }
    }
  }

  void setupClient (String? token) {
    provider = Anilist(accessToken: token);
  }

  Future<void> logout() async {
    /// Remove the stored token
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_preferences_anilistAccessToken');

    /// Remove the current user. Will set isConnected to false
    me = null;
  }

  Future<void> getNews(DateTimeRange range) async {
    try {
      isLoading = true;

      currentNews = await provider.getSchedule(range);
    } on AnilistGetScheduleException catch (e) {
      newsError = e;
    } finally {
      isLoading = false;
    }
  }

  Future<void> getWatchLists() async {
    if (!isConnected) return;

    try {
      isWatchListLoading = true;

      watchList = await provider.getWatchLists(me!.name);
    } on AnilistGetListException catch (e) {
      watchListLoadError = e;
    } finally {
      isWatchListLoading = false;
    }
  }
}
