import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class PageInfo {
  final bool? hasNextPage;
  final int? total;

  const PageInfo({this.hasNextPage, this.total});

  @override
  String toString() => 'PageInfo(hasNextPage: $hasNextPage, total: $total)';

  factory PageInfo.fromMap(Map<String, dynamic> data) => PageInfo(
        hasNextPage: data['hasNextPage'] as bool?,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'hasNextPage': hasNextPage,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PageInfo].
  factory PageInfo.fromJson(String data) {
    return PageInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PageInfo] to a JSON string.
  String toJson() => json.encode(toMap());

  PageInfo copyWith({
    bool? hasNextPage,
    int? total,
  }) {
    return PageInfo(
      hasNextPage: hasNextPage ?? this.hasNextPage,
      total: total ?? this.total,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PageInfo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => hasNextPage.hashCode ^ total.hashCode;
}
