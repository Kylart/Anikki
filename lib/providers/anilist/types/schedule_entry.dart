import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'media/media.dart';

@immutable
class ScheduleEntry {
  final int? id;
  final int? episode;
  final int? airingAt;
  final Media? media;

  const ScheduleEntry({this.id, this.episode, this.airingAt, this.media});

  @override
  String toString() {
    return 'ScheduleEntry(id: $id, episode: $episode, airingAt: $airingAt, media: $media)';
  }

  factory ScheduleEntry.fromMap(Map<String, dynamic> data) => ScheduleEntry(
        id: data['id'] as int?,
        episode: data['episode'] as int?,
        airingAt: data['airingAt'] as int?,
        media: data['media'] == null
            ? null
            : Media.fromMap(data['media'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'episode': episode,
        'airingAt': airingAt,
        'media': media?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ScheduleEntry].
  factory ScheduleEntry.fromJson(String data) {
    return ScheduleEntry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ScheduleEntry] to a JSON string.
  String toJson() => json.encode(toMap());

  ScheduleEntry copyWith({
    int? id,
    int? episode,
    int? airingAt,
    Media? media,
  }) {
    return ScheduleEntry(
      id: id ?? this.id,
      episode: episode ?? this.episode,
      airingAt: airingAt ?? this.airingAt,
      media: media ?? this.media,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ScheduleEntry) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^ episode.hashCode ^ airingAt.hashCode ^ media.hashCode;
}
