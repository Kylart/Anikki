import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class NextAiringEpisode {
  final int? airingAt;
  final int? timeUntilAiring;
  final int? episode;

  const NextAiringEpisode({
    this.airingAt,
    this.timeUntilAiring,
    this.episode,
  });

  @override
  String toString() {
    return 'NextAiringEpisode(airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode)';
  }

  factory NextAiringEpisode.fromMap(Map<String, dynamic> data) {
    return NextAiringEpisode(
      airingAt: data['airingAt'] as int?,
      timeUntilAiring: data['timeUntilAiring'] as int?,
      episode: data['episode'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'airingAt': airingAt,
        'timeUntilAiring': timeUntilAiring,
        'episode': episode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NextAiringEpisode].
  factory NextAiringEpisode.fromJson(String data) {
    return NextAiringEpisode.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NextAiringEpisode] to a JSON string.
  String toJson() => json.encode(toMap());

  NextAiringEpisode copyWith({
    int? airingAt,
    int? timeUntilAiring,
    int? episode,
  }) {
    return NextAiringEpisode(
      airingAt: airingAt ?? this.airingAt,
      timeUntilAiring: timeUntilAiring ?? this.timeUntilAiring,
      episode: episode ?? this.episode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NextAiringEpisode) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      airingAt.hashCode ^ timeUntilAiring.hashCode ^ episode.hashCode;
}
