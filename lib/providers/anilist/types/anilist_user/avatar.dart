import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Avatar {
  final String? large;
  final String? medium;

  const Avatar({this.large, this.medium});

  @override
  String toString() => 'Avatar(large: $large, medium: $medium)';

  factory Avatar.fromMap(Map<String, dynamic> data) => Avatar(
        large: data['large'] as String?,
        medium: data['medium'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'large': large,
        'medium': medium,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Avatar].
  factory Avatar.fromJson(String data) {
    return Avatar.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Avatar] to a JSON string.
  String toJson() => json.encode(toMap());
}
