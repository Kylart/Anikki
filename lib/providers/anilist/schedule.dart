import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:kawanime/providers/anilist/queries/airing_schedule.dart';
import 'package:kawanime/providers/anilist/types/page_info.dart';
import 'package:kawanime/providers/anilist/types/schedule_entry.dart';
import 'package:kawanime/providers/anilist/types/schedule_entry_page.dart';

class AnilistAiringSchedule with ChangeNotifier {
  AnilistAiringSchedule({required this.client});

  GraphQLClient client;
  int currentPage = 1;
  bool isLoading = false;
  String? error;

  Map<DateTime, List<ScheduleEntry>> schedule = {};
  DateTime latestDate = DateTime.now();

  bool get hasEntries => schedule.isNotEmpty;
  List<ScheduleEntry> get latestEntries => schedule[latestDate] ?? [];

  Future<void> getEntriesForDate(DateTime date) async {
    try {
      isLoading = true;
      notifyListeners();

      while (true) {
        final page = await _getScheduleAtPage(currentPage, date);

        if (page == null) break;

        currentPage++;

        if (schedule[date] == null) {
          schedule[date] = page.airingSchedules;
        } else {
          schedule[date]!.addAll(page.airingSchedules);
        }
      }

      latestDate = date;
      isLoading = false;
      error = null;

      notifyListeners();

      debugPrint('Retrieved page $currentPage for $latestDate');
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  Future<ScheduleEntryPage?> _getScheduleAtPage(int pageIndex, DateTime date) async {
    int nextWeek = date.millisecondsSinceEpoch + (1000 * 60 * 60 * 24);

    final QueryOptions<ScheduleEntryPage> options =
        QueryOptions<ScheduleEntryPage>(
      document: gql(airingScheduleQuery),
      variables: <String, dynamic>{
        'weekStart': (date.millisecondsSinceEpoch / 1000).round(),
        'weekEnd': (nextWeek / 1000).round(),
        'page': pageIndex
      },
    );

    final QueryResult<ScheduleEntryPage> result =
        await client.query<ScheduleEntryPage>(options);

    final List<dynamic> rawEntries = result.data?['Page']['airingSchedules'];

    if (rawEntries.isEmpty) return null;

    final List<ScheduleEntry> airingSchedules = rawEntries
        .map((e) => ScheduleEntry.fromMap(e))
        .where((element) => element.media?.countryOfOrigin == 'JP')
        .toList();

    final PageInfo pageInfo =
        PageInfo.fromMap(result.data?['Page']['pageInfo']);

    final ScheduleEntryPage page =
        ScheduleEntryPage(pageInfo: pageInfo, airingSchedules: airingSchedules);

    return page;
  }
}
