import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Options {
  final bool? displayAdultContent;
  final bool? airingNotifications;
  final String? profileColor;

  const Options({
    this.displayAdultContent,
    this.airingNotifications,
    this.profileColor,
  });

  @override
  String toString() {
    return 'Options(displayAdultContent: $displayAdultContent, airingNotifications: $airingNotifications, profileColor: $profileColor)';
  }

  factory Options.fromMap(Map<String, dynamic> data) => Options(
        displayAdultContent: data['displayAdultContent'] as bool?,
        airingNotifications: data['airingNotifications'] as bool?,
        profileColor: data['profileColor'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'displayAdultContent': displayAdultContent,
        'airingNotifications': airingNotifications,
        'profileColor': profileColor,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Options].
  factory Options.fromJson(String data) {
    return Options.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Options] to a JSON string.
  String toJson() => json.encode(toMap());
}
