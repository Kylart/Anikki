import 'dart:convert';
import 'dart:io';

import 'package:anilist/anilist.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///
/// [LocalFile] represents a file on the host machine. It can be used
/// for any file but Anikki will use it only for video files.
///
/// [LocalFile] is `immutable`.
///
/// A [LocalFile] is identified by its [path] property only.
///
/// Example;
///
/// ```dart
/// final path = 'path/to/file';
/// final file = File(path);
///
/// /// From the [Anitomy] package
/// final parser = Anitomy(inputString: basename(path));
///
/// LocalFile localFile = LocalFile(
///   path: path,
///   file: file,
///   episode: parser.episode != null ? int.tryParse(parser.episode!) : null,
///   releaseGroup: parser.releaseGroup,
///   title: parser.title,
/// );
/// ```
///
@immutable
class LocalFile extends Equatable {
  const LocalFile({
    required this.path,
    required this.file,
    this.title,
    this.episode,
    this.releaseGroup,
    this.media,
  });

  /// Absolute path of the current [LocalFile]
  final String path;

  /// [File] instance of the file at [path]
  final File file;

  /// Parsed title using the Anitomy parser.
  final String? title;

  /// Parsed episode using the Anitomy parser.
  final int? episode;

  /// Parsed release group using the Anitomy parser.
  final String? releaseGroup;

  /// Anilist media retrieved using the parsed title if any.
  final Fragment$shortMedia? media;

  /// For the [Equatable] class. Only path is used there since a file is
  /// identified by its path.
  @override
  List<Object?> get props => [
        path,
      ];

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
