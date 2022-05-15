import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:kawanime/services/externals/anilist/queries/airing_schedule.dart';
import 'package:kawanime/services/externals/anilist/types/page_info.dart';
import 'package:kawanime/services/externals/anilist/types/scheduleEntryPage.dart';

import 'package:kawanime/services/externals/anilist/types/schedule_entry.dart';

class AnilistAiringSchedule with ChangeNotifier {
  AnilistAiringSchedule({required this.client});

  GraphQLClient client;
  int currentPage = 1;

  Map<DateTime, List<ScheduleEntry>> schedule = {};
  DateTime latestDate = DateTime.now();

  bool get hasEntries => schedule.isNotEmpty;
  List<ScheduleEntry> get latestEntries => schedule[latestDate] ?? []; 

  Future<void> getEntriesForDate(DateTime date) async {
    try {
      int nextWeek = date.millisecondsSinceEpoch + (1000 * 60 * 60 * 24 * 7);

      final QueryOptions<ScheduleEntryPage> options = QueryOptions<ScheduleEntryPage>(
        document: gql(airingScheduleQuery),
        variables: <String, dynamic>{
          'weekStart': (date.millisecondsSinceEpoch / 1000).round(),
          'weekEnd': (nextWeek / 1000).round(),
          'page': currentPage
        },
      );

      final QueryResult<ScheduleEntryPage> result = await client.query<ScheduleEntryPage>(options);

      final List<dynamic> rawEntries = result.data?['Page']['airingSchedules'];
      final List<ScheduleEntry> airingSchedules = rawEntries.map((e) => ScheduleEntry.fromMap(e)).toList();

      final PageInfo pageInfo = PageInfo.fromMap(result.data?['Page']['pageInfo']);

      final ScheduleEntryPage page = ScheduleEntryPage(pageInfo: pageInfo, airingSchedules: airingSchedules);
      
      schedule[date] = page.airingSchedules;
      latestDate = date;

      notifyListeners();

      debugPrint('Retrieved page $currentPage for $latestDate');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
