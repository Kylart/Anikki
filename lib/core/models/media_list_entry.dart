// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';

class MediaListEntry extends Equatable {
  const MediaListEntry({
    required this.media,
    required this.progress,
    this.updatedAt,
  });

  final Media media;
  final int? progress;
  final int? updatedAt;

  factory MediaListEntry.fromAnilistListEntry(
    AnilistListEntry listEntry, [
    Media? media,
  ]) {
    return MediaListEntry(
      media: media ?? Media(anilistInfo: listEntry.media),
      progress: listEntry.progress,
      updatedAt: listEntry.updatedAt,
    );
  }

  MediaListEntry copyWith({
    Media? media,
    int? progress,
    int? updatedAt,
  }) {
    return MediaListEntry(
      media: media ?? this.media,
      progress: progress ?? this.progress,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'media': media.toMap(),
      'progress': progress,
      'updatedAt': updatedAt,
    };
  }

  factory MediaListEntry.fromMap(Map<String, dynamic> map) {
    return MediaListEntry(
      media: Media.fromMap(map['media'] as Map<String, dynamic>),
      progress: map['progress'] != null ? map['progress'] as int : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaListEntry.fromJson(String source) =>
      MediaListEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [media, progress, updatedAt];
}
