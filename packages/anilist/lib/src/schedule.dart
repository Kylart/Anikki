import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/exceptions/exceptions.dart';
import 'package:anilist/src/models/models.dart';

mixin AnilistSchedule on AnilistClient {
  Future<List<Query$AiringSchedule$Page$airingSchedules>> getSchedule(
      DateTimeRange range) async {
    try {
      final result =
          await client.query$AiringSchedule(Options$Query$AiringSchedule(
              variables: Variables$Query$AiringSchedule(
        start: (range.start.millisecondsSinceEpoch / 1000).round(),
        end: (range.end.millisecondsSinceEpoch / 1000).round(),
        page: 1,
      )));

      if (result.hasException) {
        throw AnilistGetScheduleException(error: result.exception.toString());
      }

      return result.parsedData?.Page?.airingSchedules
              ?.whereType<Query$AiringSchedule$Page$airingSchedules>()
              .toList() ??
          [];
    } on GraphQLError catch (e) {
      throw AnilistGetScheduleException(error: e.message);
    }
  }
}
