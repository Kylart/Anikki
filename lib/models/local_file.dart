import 'dart:convert';
import 'dart:io';

import 'package:anilist/anilist.dart';
import 'package:equatable/equatable.dart';

class LocalFile extends Equatable {
  final String path;
  final File file;
  final String? title;
  final int? episode;
  final String? releaseGroup;
  final Fragment$shortMedia? media;

  @override
  List<Object?> get props => [
    path,
  ];


  const LocalFile({
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
    int? episode,
    String? releaseGroup,
    Fragment$shortMedia? media,
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
      'media': media?.toString(),
    };
  }

  factory LocalFile.fromMap(Map<String, dynamic> map) {
    return LocalFile(
      path: map['path'] ?? '',
      file: File(map['path']),
      title: map['title'],
      episode: map['episode'],
      releaseGroup: map['releaseGroup'],
      media: Fragment$shortMedia.fromJson(map['media']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalFile.fromJson(String source) =>
      LocalFile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocalFile(path: $path, file: $file, title: $title, episode: $episode, releaseGroup: $releaseGroup, media: $media)';
  }
}
