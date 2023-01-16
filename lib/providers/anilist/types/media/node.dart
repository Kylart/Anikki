import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class Node {
  final int? id;
  final String? name;

  const Node({this.id, this.name});

  @override
  String toString() => 'Node(id: $id, name: $name)';

  factory Node.fromMap(Map<String, dynamic> data) => Node(
        id: data['id'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Node].
  factory Node.fromJson(String data) {
    return Node.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Node] to a JSON string.
  String toJson() => json.encode(toMap());

  Node copyWith({
    int? id,
    String? name,
  }) {
    return Node(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Node) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
