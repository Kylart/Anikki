import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'edge.dart';

@immutable
class Relations {
  final List<Edge>? edges;

  const Relations({this.edges});

  @override
  String toString() => 'Relations(edges: $edges)';

  factory Relations.fromMap(Map<String, dynamic> data) => Relations(
        edges: (data['edges'] as List<dynamic>?)
            ?.map((e) => Edge.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'edges': edges?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Relations].
  factory Relations.fromJson(String data) {
    return Relations.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Relations] to a JSON string.
  String toJson() => json.encode(toMap());

  Relations copyWith({
    List<Edge>? edges,
  }) {
    return Relations(
      edges: edges ?? this.edges,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Relations) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => edges.hashCode;
}
