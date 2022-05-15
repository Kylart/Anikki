import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'edge.dart';

@immutable
class Studios {
  final List<Edge>? edges;

  const Studios({this.edges});

  @override
  String toString() => 'Studios(edges: $edges)';

  factory Studios.fromMap(Map<String, dynamic> data) => Studios(
        edges: (data['edges'] as List<dynamic>?)
            ?.map((e) => Edge.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'edges': edges?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Studios].
  factory Studios.fromJson(String data) {
    return Studios.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Studios] to a JSON string.
  String toJson() => json.encode(toMap());

  Studios copyWith({
    List<Edge>? edges,
  }) {
    return Studios(
      edges: edges ?? this.edges,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Studios) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => edges.hashCode;
}
