import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class StartDate {
  final int? year;
  final int? month;
  final int? day;

  const StartDate({this.year, this.month, this.day});

  @override
  String toString() => 'StartDate(year: $year, month: $month, day: $day)';

  factory StartDate.fromMap(Map<String, dynamic> data) => StartDate(
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
  /// Parses the string and returns the resulting Json object as [StartDate].
  factory StartDate.fromJson(String data) {
    return StartDate.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StartDate] to a JSON string.
  String toJson() => json.encode(toMap());

  StartDate copyWith({
    int? year,
    int? month,
    int? day,
  }) {
    return StartDate(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! StartDate) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
}
