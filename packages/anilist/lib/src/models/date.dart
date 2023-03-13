import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class AnilistDate {
  final int? year;
  final int? month;
  final int? day;

  const AnilistDate({this.year, this.month, this.day});

  DateTime? toDateTime() => year != null && month != null && day != null
      ? DateTime(year!, month!, day!)
      : null;

  factory AnilistDate.fromDateTime(DateTime dateTime) => AnilistDate(
        year: dateTime.year,
        month: dateTime.month,
        day: dateTime.day,
      );

  @override
  String toString() => 'StartDate(year: $year, month: $month, day: $day)';

  factory AnilistDate.fromMap(Map<String, dynamic> data) => AnilistDate(
        year: data['year'] as int?,
        month: data['month'] as int?,
        day: data['day'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'year': year,
        'month': month,
        'day': day,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnilistDate].
  factory AnilistDate.fromJson(String data) {
    return AnilistDate.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnilistDate] to a JSON string.
  String toJson() => json.encode(toMap());

  AnilistDate copyWith({
    int? year,
    int? month,
    int? day,
  }) {
    return AnilistDate(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AnilistDate) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
}
