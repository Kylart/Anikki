import 'package:anikki/core/core.dart';
import 'package:anikki/features/news/domain/models/models.dart';
import 'package:flutter/material.dart';

class NewsRepository {
  final Anilist client;

  NewsRepository(this.client);

  Future<List<NewsEntry>> getSchedule(DateTimeRange range) async {
    final entries = await client.getSchedule(range);

    return entries
        .map(
          (e) => NewsEntry.fromAnilistSchedule(e),
        )
        .toList();
  }
}
