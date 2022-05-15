import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class EndDate {
  final dynamic year;
  final dynamic month;
  final dynamic day;

  const EndDate({this.year, this.month, this.day});

  @override
  String toString() => 'EndDate(year: $year, month: $month, day: $day)';

  factory EndDate.fromMap(Map<String, dynamic> data) => EndDate(
        year: data['year'] as dynamic,
        month: data['month'] as dynamic,
        day: data['day'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'year': year,
        'month': month,
        'day': day,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EndDate].
  factory EndDate.fromJson(String data) {
    return EndDate.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EndDate] to a JSON string.
  String toJson() => json.encode(toMap());

  EndDate copyWith({
    dynamic year,
    dynamic month,
    dynamic day,
  }) {
    return EndDate(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EndDate) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
}
