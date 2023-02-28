// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:anilist/src/models/page_info.dart';
import 'package:anilist/src/models/schedule_entry.dart';
import 'package:flutter/foundation.dart';

class ScheduleEntryPage {
  final PageInfo pageInfo;
  final List<ScheduleEntry> airingSchedules;

  const ScheduleEntryPage({
    required this.pageInfo,
    required this.airingSchedules,
  });

  ScheduleEntryPage copyWith({
    PageInfo? pageInfo,
    List<ScheduleEntry>? airingSchedules,
  }) {
    return ScheduleEntryPage(
      pageInfo: pageInfo ?? this.pageInfo,
      airingSchedules: airingSchedules ?? this.airingSchedules,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pageInfo': pageInfo.toMap(),
      'airingSchedules': airingSchedules.map((x) => x.toMap()).toList(),
    };
  }

  factory ScheduleEntryPage.fromMap(Map<String, dynamic> map) {
    return ScheduleEntryPage(
      pageInfo: PageInfo.fromMap(map['pageInfo']),
      airingSchedules: List<ScheduleEntry>.from(
          map['airingSchedules']?.map((x) => ScheduleEntry.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleEntryPage.fromJson(String source) =>
      ScheduleEntryPage.fromMap(json.decode(source));

  @override
  String toString() =>
      'ScheduleEntryPage(pageInfo: $pageInfo, airingSchedules: $airingSchedules)';

  @override
  int get hashCode => pageInfo.hashCode ^ airingSchedules.hashCode;

  @override
  bool operator ==(covariant ScheduleEntryPage other) {
    if (identical(this, other)) return true;

    return other.pageInfo == pageInfo &&
        listEquals(other.airingSchedules, airingSchedules);
  }
}
