import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/exceptions/anilist_get_schedule_exception.dart';
import 'package:anilist/src/models/models.dart';
import 'package:anilist/src/queries/airing_schedule.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

mixin AnilistAiringSchedule on AnilistClient {
  Future<List<ScheduleEntry>> getSchedule(DateTimeRange dateRange) async {
    try {
      int currentPage = 1;
      List<ScheduleEntry> result = [];

      while (true) {
        final page = await getScheduleAtPage(currentPage, dateRange);

        if (page == null) break;

        currentPage++;

        result.addAll(page.airingSchedules);
      }

      return result;
    } on GraphQLError catch (e) {
      throw AnilistGetScheduleException(error: e.message);
    }
  }

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
