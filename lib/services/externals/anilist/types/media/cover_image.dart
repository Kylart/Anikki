import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class CoverImage {
  final String? extraLarge;
  final String? large;
  final String? medium;
  final String? color;

  const CoverImage({this.extraLarge, this.large, this.medium, this.color});

  @override
  String toString() {
    return 'CoverImage(extraLarge: $extraLarge, large: $large, medium: $medium, color: $color)';
  }

  factory CoverImage.fromMap(Map<String, dynamic> data) => CoverImage(
        extraLarge: data['extraLarge'] as String?,
        large: data['large'] as String?,
        medium: data['medium'] as String?,
        color: data['color'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'extraLarge': extraLarge,
        'large': large,
        'medium': medium,
        'color': color,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CoverImage].
  factory CoverImage.fromJson(String data) {
    return CoverImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CoverImage] to a JSON string.
  String toJson() => json.encode(toMap());

  CoverImage copyWith({
    String? extraLarge,
    String? large,
    String? medium,
    String? color,
  }) {
    return CoverImage(
      extraLarge: extraLarge ?? this.extraLarge,
      large: large ?? this.large,
      medium: medium ?? this.medium,
      color: color ?? this.color,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CoverImage) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      extraLarge.hashCode ^ large.hashCode ^ medium.hashCode ^ color.hashCode;
}
