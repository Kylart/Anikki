import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Image {
  final String? medium;
  final String? large;

  const Image({this.medium, this.large});

  @override
  String toString() => 'Image(medium: $medium, large: $large)';

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        medium: data['medium'] as String?,
        large: data['large'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'medium': medium,
        'large': large,
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
    String? medium,
    String? large,
  }) {
    return Image(
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Image && other.medium == medium && other.large == large;
  }

  @override
  int get hashCode => medium.hashCode ^ large.hashCode;
}
