import 'dart:convert';

import 'package:anilist/anilist.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/models/local_file.dart';

class LibraryEntry extends Equatable {
  final Fragment$shortMedia? media;
  final List<LocalFile> entries;

  @override
  List<Object?> get props => [media, entries, epMax, epMin];

  int? get epMax {
    int? result;

    for (final entry in entries) {
      if (entry.episode == null) continue;

      final episode = entry.episode;

      if (episode == null) continue;

      result ??= episode;

      if (episode > result) result = episode;
    }

    return result;
  }

  int? get epMin {
    int? result;

    for (final entry in entries) {
      if (entry.episode == null) continue;

      final episode = entry.episode;

      if (episode == null) continue;

      result ??= episode;

      if (episode < result) result = episode;
    }

    return result;
  }

  const LibraryEntry({
    required this.media,
    required this.entries,
  });

  LibraryEntry copyWith({
    Fragment$shortMedia? media,
    List<LocalFile>? entries,
  }) {
    return LibraryEntry(
      media: media ?? this.media,
      entries: entries ?? this.entries,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'media': media?.toJson(),
      'entries': entries.map((x) => x.toMap()).toList(),
    };
  }

  factory LibraryEntry.fromMap(Map<String, dynamic> map) {
    return LibraryEntry(
      media: Fragment$shortMedia.fromJson(map['media'] as Map<String, dynamic>),
      entries: List<LocalFile>.from(
        (map['entries'] as List<int>).map<LocalFile>(
          (x) => LocalFile.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LibraryEntry.fromJson(String source) =>
      LibraryEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LibraryEntry(media: $media, entries: $entries)';
}
