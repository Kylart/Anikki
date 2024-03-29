import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';

///
/// [LibraryEntry] represents a entry for the `Library` feature.
/// It helps group multiple [LocalFile] from the same Anilist `media`.
///
@immutable
class LibraryEntry extends Equatable {
  const LibraryEntry({
    required this.media,
    required this.entries,
  });

  /// Media information from Anilist
  final Media? media;

  /// `List` of [LocalFile] that are contained by this [LibraryEntry]
  final List<LocalFile> entries;

  /// Maximum episode parsed from the [entries] property
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

  /// Minimum episode parsed from the [entries] property
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

  @override
  List<Object?> get props => [media, entries, epMax, epMin];

  LibraryEntry copyWith({
    Media? media,
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
      media: Media.fromMap(map['media'] as Map<String, dynamic>),
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
