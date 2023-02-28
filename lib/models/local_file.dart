
import 'dart:convert';
import 'dart:io';

import 'package:anilist/anilist.dart';

class LocalFile {
  final String path;
  final File file;
  final String? title;
  final String? episode;
  final String? releaseGroup;
  Media? media;

  LocalFile({
    required this.path,
    required this.file,
    this.title,
    this.episode,
    this.releaseGroup,
    this.media,
  });

  LocalFile copyWith({
    String? path,
    File? file,
    String? title,
    String? episode,
    String? releaseGroup,
    Media? media,
  }) {
    return LocalFile(
      path: path ?? this.path,
      file: file ?? this.file,
      title: title ?? this.title,
      episode: episode ?? this.episode,
      releaseGroup: releaseGroup ?? this.releaseGroup,
      media: media ?? this.media,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'file': file,
      'title': title,
      'episode': episode,
      'releaseGroup': releaseGroup,
      'media': media?.toMap(),
    };
  }

  factory LocalFile.fromMap(Map<String, dynamic> map) {
    return LocalFile(
      path: map['path'] ?? '',
      file: File(map['path']),
      title: map['title'],
      episode: map['episode'],
      releaseGroup: map['releaseGroup'],
      media: map['media'] != null ? Media.fromMap(map['media']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalFile.fromJson(String source) =>
      LocalFile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocalFile(path: $path, file: $file, title: $title, episode: $episode, releaseGroup: $releaseGroup, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalFile &&
        other.path == path;
  }

  @override
  int get hashCode {
    return path.hashCode ^
        file.hashCode ^
        title.hashCode ^
        episode.hashCode ^
        releaseGroup.hashCode ^
        media.hashCode;
  }
}
