import 'dart:convert';
import 'dart:io';

import 'package:anitomy/anitomy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

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
/// final Fragment$shortMedia media = getMedia();
///
/// LocalFile localFile = LocalFile(
///   path: path,
///   media: media,
/// );
/// ```
///
@immutable
class LocalFile extends Equatable {
  LocalFile({
    required this.path,
    this.media,
    int? episode,
    File? file,
  }) {
    this.file = file ?? File(path);

    final parser = Anitomy(inputString: basename(path));
    title = parser.title;
    this.episode = episode ?? int.tryParse(parser.episode ?? '');
    releaseGroup = parser.releaseGroup;

    parser.dispose();
  }

  /// Absolute path of the current [LocalFile]
  final String path;

  /// [File] instance of the file at [path]
  late final File file;

  /// Parsed title using the [Anitomy] parser.
  late final String? title;

  /// Parsed episode using the [Anitomy] parser.
  late final int? episode;

  /// Parsed release group using the [Anitomy] parser.
  late final String? releaseGroup;

  /// Anilist media retrieved using the parsed title if any.
  final Media? media;

  /// For the [Equatable] class. Only path is used there since a file is
  /// identified by its path.
  @override
  List<Object?> get props => [
        path,
      ];

  ///
  /// Create a [LocalFile] and tries to search for its media on Anilsit
  /// If no media information can be found, the `media` property will be `null`.
  ///
  static Future<LocalFile> createAndSearchMedia(String path) async {
    final tmpFile = LocalFile(path: path);

    if (tmpFile.title == null) return tmpFile;
    if (Platform.environment.containsKey('FLUTTER_TEST')) return tmpFile;

    try {
      final anilist = Anilist(client: getAnilistClient());

      final info = await anilist.infoFromMultiple([tmpFile.title!]);

      return tmpFile.copyWith(
        media: Media(anilistInfo: info.values.first),
      );
    } catch (e) {
      logger.t('Could not retrieve file media info for $path');
    }

    return tmpFile;
  }

  LocalFile copyWith({
    String? path,
    int? episode,
    File? file,
    Media? media,
  }) {
    return LocalFile(
      path: path ?? this.path,
      media: media ?? this.media,
      episode: episode,
      file: file,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'media': media?.toJson(),
    };
  }

  factory LocalFile.fromMap(Map<String, dynamic> map) {
    return LocalFile(
      path: map['path'] ?? '',
      media: Media.fromMap(map['media']),
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
