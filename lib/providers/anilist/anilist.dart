import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:protocol_handler/protocol_handler.dart';

import 'package:anikki/helpers/mixins/loading.dart';
import 'package:anikki/providers/anilist/info.dart';
import 'package:anikki/providers/anilist/schedule.dart';
import 'package:anikki/providers/anilist/standalone.dart';
import 'package:anikki/providers/anilist/types/schedule_entry.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class AnilistStore
    with
        ChangeNotifier,
        DiagnosticableTreeMixin,
        LoadingMixin,
        ProtocolListener {
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
    protocolHandler.addListener(this);

    // Retrieve previous token if any
    setupClient();

    await getNews(currentRange);
    notifyListeners();
  }

  void setupClient({Map<String, String>? headers}) {
    final AnilistStandalone anilist = AnilistStandalone(headers: headers);

    airingSchedule = anilist.airingSchedule;
    info = anilist.info;
  }

  final availableHosts = [
    'anilist-auth',
  ];

  @override
  void onProtocolUrlReceived(String url) {
    final uri = Uri.parse(url);

    /**
     * On `anikki://anilist-auth?blabla=hello`
     * 
     * final scheme = uri.scheme; // anikki
     * final host = uri.host; // anilist-auth
     * final query = uri.query; // blabla=hello
     * final params = uri.queryParameters; // {blabla: hello}
     */

    if (!availableHosts.contains(uri.host)) return;

    handleAuth(uri);
  }

  void handleAuth(Uri uri) {
    if (uri.host != 'anilist-auth') return;

    final token = uri.queryParameters['access_token'];

    if (token == null) return;

    final headers = {
      'Access-Token': 'Bearer $token',
    };

    setupClient(headers: headers);

    // TODO: Store access token somehow
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
