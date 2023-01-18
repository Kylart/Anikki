import 'dart:convert';

import 'package:kawanime/providers/anilist/types/media/media.dart';

class LocalFile {
  final String path;
  final Media? media;
  final String? episode;

  LocalFile({
    required this.path,
    this.media,
    this.episode,
  });

  LocalFile copyWith({
    String? path,
    Media? media,
    String? episode,
  }) {
    return LocalFile(
      path: path ?? this.path,
      media: media ?? this.media,
      episode: episode ?? this.episode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'media': media?.toMap(),
      'episode': episode,
    };
  }

  factory LocalFile.fromMap(Map<String, dynamic> map) {
    return LocalFile(
      path: map['path'] ?? '',
      media: map['media'] != null ? Media.fromMap(map['media']) : null,
      episode: map['episode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalFile.fromJson(String source) => LocalFile.fromMap(json.decode(source));

  @override
  String toString() => 'LocalFile(path: $path, media: $media, episode: $episode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LocalFile &&
      other.path == path &&
      other.media == media &&
      other.episode == episode;
  }

  @override
  int get hashCode => path.hashCode ^ media.hashCode ^ episode.hashCode;
}
