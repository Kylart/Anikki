import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class Title {
  final String? userPreferred;
  final String? romaji;
  final String? english;
  final String? native;

  const Title({this.userPreferred, this.romaji, this.english, this.native});

  String title() {
    return romaji ?? english ?? native ?? 'N/A';
  }

  @override
  String toString() {
    return 'Title(userPreferred: $userPreferred, romaji: $romaji, english: $english, native: $native)';
  }

  factory Title.fromMap(Map<String, dynamic> data) => Title(
        userPreferred: data['userPreferred'] as String?,
        romaji: data['romaji'] as String?,
        english: data['english'] as String?,
        native: data['native'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'userPreferred': userPreferred,
        'romaji': romaji,
        'english': english,
        'native': native,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Title].
  factory Title.fromJson(String data) {
    return Title.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Title] to a JSON string.
  String toJson() => json.encode(toMap());

  Title copyWith({
    String? userPreferred,
    String? romaji,
    String? english,
    String? native,
  }) {
    return Title(
      userPreferred: userPreferred ?? this.userPreferred,
      romaji: romaji ?? this.romaji,
      english: english ?? this.english,
      native: native ?? this.native,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Title) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      userPreferred.hashCode ^
      romaji.hashCode ^
      english.hashCode ^
      native.hashCode;
}
