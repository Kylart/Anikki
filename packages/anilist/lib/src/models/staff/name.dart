import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class Name {
  final String? full;
  final String? native;

  const Name({this.full, this.native});

  @override
  String toString() => 'Name(full: $full, native: $native)';

  factory Name.fromMap(Map<String, dynamic> data) => Name(
        full: data['full'] as String?,
        native: data['native'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'full': full,
        'native': native,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Name].
  factory Name.fromJson(String data) {
    return Name.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Name] to a JSON string.
  String toJson() => json.encode(toMap());

  Name copyWith({
    String? full,
    String? native,
  }) {
    return Name(
      full: full ?? this.full,
      native: native ?? this.native,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Name) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => full.hashCode ^ native.hashCode;
}
