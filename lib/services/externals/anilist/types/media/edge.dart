import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'node.dart';

@immutable
class Edge {
  final bool? isMain;
  final Node? node;

  const Edge({this.isMain, this.node});

  @override
  String toString() => 'Edge(isMain: $isMain, node: $node)';

  factory Edge.fromMap(Map<String, dynamic> data) => Edge(
        isMain: data['isMain'] as bool?,
        node: data['node'] == null
            ? null
            : Node.fromMap(data['node'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'isMain': isMain,
        'node': node?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Edge].
  factory Edge.fromJson(String data) {
    return Edge.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Edge] to a JSON string.
  String toJson() => json.encode(toMap());

  Edge copyWith({
    bool? isMain,
    Node? node,
  }) {
    return Edge(
      isMain: isMain ?? this.isMain,
      node: node ?? this.node,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Edge) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => isMain.hashCode ^ node.hashCode;
}
