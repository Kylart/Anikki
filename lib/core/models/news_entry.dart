import 'dart:convert';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

class NewsEntry {
  NewsEntry({
    this.episode,
    required this.media,
    required this.airingAt,
  });

  final int? episode;
  final Media media;
  final DateTime airingAt;

  NewsEntry copyWith({
    int? episode,
    Media? media,
    DateTime? airingAt,
  }) {
    return NewsEntry(
      episode: episode ?? this.episode,
      media: media ?? this.media,
      airingAt: airingAt ?? this.airingAt,
    );
  }

  factory NewsEntry.fromAnilistSchedule(
      Query$AiringSchedule$Page$airingSchedules entry) {
    return NewsEntry(
      media: Media(anilistInfo: entry.media),
      airingAt: DateTime.fromMillisecondsSinceEpoch(entry.airingAt * 1000),
      episode: entry.episode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'episode': episode,
      'media': media.toMap(),
      'airingAt': airingAt.millisecondsSinceEpoch,
    };
  }

  factory NewsEntry.fromMap(Map<String, dynamic> map) {
    return NewsEntry(
      episode: map['episode'] != null ? map['episode'] as int : null,
      media: Media.fromMap(map['media'] as Map<String, dynamic>),
      airingAt: DateTime.fromMillisecondsSinceEpoch(map['airingAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsEntry.fromJson(String source) =>
      NewsEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NewsEntry(episode: $episode, media: $media, airingAt: $airingAt)';

  @override
  bool operator ==(covariant NewsEntry other) {
    if (identical(this, other)) return true;

    return other.episode == episode &&
        other.media == media &&
        other.airingAt == airingAt;
  }

  @override
  int get hashCode => episode.hashCode ^ media.hashCode ^ airingAt.hashCode;
}
