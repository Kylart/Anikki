import 'package:anikki/providers/anilist/anilist_client.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'package:anikki/providers/anilist/queries/airing_schedule.dart';
import 'package:anikki/providers/anilist/types/page_info.dart';
import 'package:anikki/providers/anilist/types/schedule_entry.dart';
import 'package:anikki/providers/anilist/types/schedule_entry_page.dart';

mixin AnilistAiringSchedule on AnilistClient {
  Future<ScheduleEntryPage?> getScheduleAtPage(
      int pageIndex, DateTimeRange dateRange) async {
    final QueryOptions<ScheduleEntryPage> options =
        QueryOptions<ScheduleEntryPage>(
      document: gql(airingScheduleQuery),
      variables: <String, dynamic>{
        'weekStart': (dateRange.start.millisecondsSinceEpoch / 1000).round(),
        'weekEnd': (dateRange.end.millisecondsSinceEpoch / 1000).round(),
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
