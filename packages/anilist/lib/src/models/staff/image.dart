import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class Image {
  final String? large;
  final String? medium;

  const Image({this.large, this.medium});

  @override
  String toString() => 'Image(large: $large, medium: $medium)';

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        large: data['large'] as String?,
        medium: data['medium'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'large': large,
        'medium': medium,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
  factory Image.fromJson(String data) {
    return Image.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
  String toJson() => json.encode(toMap());

  Image copyWith({
    String? large,
    String? medium,
  }) {
    return Image(
      large: large ?? this.large,
      medium: medium ?? this.medium,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Image) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => large.hashCode ^ medium.hashCode;
}
