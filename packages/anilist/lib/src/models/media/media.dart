import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'cover_image.dart';
import 'next_airing_episode.dart';
import 'relations.dart';
import '../date.dart';
import 'studios.dart';
import 'title.dart';

@immutable
class Media {
  final int? id;
  final Title? title;
  final CoverImage? coverImage;
  final AnilistDate? startDate;
  final AnilistDate? endDate;
  final dynamic bannerImage;
  final String? season;
  final String? description;
  final String? type;
  final String? format;
  final String? countryOfOrigin;
  final String? status;
  final dynamic episodes;
  final int? duration;
  final dynamic chapters;
  final dynamic volumes;
  final List<Object?>? genres;
  final bool? isAdult;
  final int? averageScore;
  final int? popularity;
  final dynamic mediaListEntry;
  final NextAiringEpisode? nextAiringEpisode;
  final Studios? studios;
  final Relations? relations;

  const Media({
    this.id,
    this.title,
    this.coverImage,
    this.startDate,
    this.endDate,
    this.bannerImage,
    this.season,
    this.description,
    this.type,
    this.format,
    this.countryOfOrigin,
    this.status,
    this.episodes,
    this.duration,
    this.chapters,
    this.volumes,
    this.genres,
    this.isAdult,
    this.averageScore,
    this.popularity,
    this.mediaListEntry,
    this.nextAiringEpisode,
    this.studios,
    this.relations,
  });

  @override
  String toString() {
    return 'Media(id: $id, title: $title, coverImage: $coverImage, startDate: $startDate, endDate: $endDate, bannerImage: $bannerImage, season: $season, description: $description, type: $type, format: $format, countryOfOrigin: $countryOfOrigin, status: $status, episodes: $episodes, duration: $duration, chapters: $chapters, volumes: $volumes, genres: $genres, isAdult: $isAdult, averageScore: $averageScore, popularity: $popularity, mediaListEntry: $mediaListEntry, nextAiringEpisode: $nextAiringEpisode, studios: $studios, relations: $relations)';
  }

  factory Media.fromMap(Map<String, dynamic> data) => Media(
        id: data['id'] as int?,
        title: data['title'] == null
            ? null
            : Title.fromMap(data['title'] as Map<String, dynamic>),
        coverImage: data['coverImage'] == null
            ? null
            : CoverImage.fromMap(data['coverImage'] as Map<String, dynamic>),
        startDate: data['startDate'] == null
            ? null
            : AnilistDate.fromMap(data['startDate'] as Map<String, dynamic>),
        endDate: data['endDate'] == null
            ? null
            : AnilistDate.fromMap(data['endDate'] as Map<String, dynamic>),
        bannerImage: data['bannerImage'] as dynamic,
        season: data['season'] as String?,
        description: data['description'] as String?,
        type: data['type'] as String?,
        format: data['format'] as String?,
        status: data['status'] as String?,
        countryOfOrigin: data['countryOfOrigin'] as String?,
        episodes: data['episodes'] as dynamic,
        duration: data['duration'] as int?,
        chapters: data['chapters'] as dynamic,
        volumes: data['volumes'] as dynamic,
        genres: data['genres'] as List<Object?>?,
        isAdult: data['isAdult'] as bool?,
        averageScore: data['averageScore'] as int?,
        popularity: data['popularity'] as int?,
        mediaListEntry: data['mediaListEntry'] as dynamic,
        nextAiringEpisode: data['nextAiringEpisode'] == null
            ? null
            : NextAiringEpisode.fromMap(
                data['nextAiringEpisode'] as Map<String, dynamic>),
        studios: data['studios'] == null
            ? null
            : Studios.fromMap(data['studios'] as Map<String, dynamic>),
        relations: data['relations'] == null
            ? null
            : Relations.fromMap(data['relations'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title?.toMap(),
      'coverImage': coverImage?.toMap(),
      'startDate': startDate?.toMap(),
      'endDate': endDate?.toMap(),
      'bannerImage': bannerImage,
      'season': season,
      'description': description,
      'type': type,
      'format': format,
      'countryOfOrigin': countryOfOrigin,
      'status': status,
      'episodes': episodes,
      'duration': duration,
      'chapters': chapters,
      'volumes': volumes,
      'genres': genres,
      'isAdult': isAdult,
      'averageScore': averageScore,
      'popularity': popularity,
      'mediaListEntry': mediaListEntry,
      'nextAiringEpisode': nextAiringEpisode?.toMap(),
      'studios': studios?.toMap(),
      'relations': relations?.toMap(),
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Media].
  factory Media.fromJson(String data) {
    return Media.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Media] to a JSON string.
  String toJson() => json.encode(toMap());

  Media copyWith({
    int? id,
    Title? title,
    CoverImage? coverImage,
    AnilistDate? startDate,
    AnilistDate? endDate,
    dynamic bannerImage,
    String? season,
    String? description,
    String? type,
    String? format,
    String? countryOfOrigin,
    String? status,
    dynamic episodes,
    int? duration,
    dynamic chapters,
    dynamic volumes,
    List<Object?>? genres,
    bool? isAdult,
    int? averageScore,
    int? popularity,
    dynamic mediaListEntry,
    NextAiringEpisode? nextAiringEpisode,
    Studios? studios,
    Relations? relations,
  }) {
    return Media(
      id: id ?? this.id,
      title: title ?? this.title,
      coverImage: coverImage ?? this.coverImage,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      bannerImage: bannerImage ?? this.bannerImage,
      season: season ?? this.season,
      description: description ?? this.description,
      type: type ?? this.type,
      format: format ?? this.format,
      countryOfOrigin: countryOfOrigin ?? this.countryOfOrigin,
      status: status ?? this.status,
      episodes: episodes ?? this.episodes,
      duration: duration ?? this.duration,
      chapters: chapters ?? this.chapters,
      volumes: volumes ?? this.volumes,
      genres: genres ?? this.genres,
      isAdult: isAdult ?? this.isAdult,
      averageScore: averageScore ?? this.averageScore,
      popularity: popularity ?? this.popularity,
      mediaListEntry: mediaListEntry ?? this.mediaListEntry,
      nextAiringEpisode: nextAiringEpisode ?? this.nextAiringEpisode,
      studios: studios ?? this.studios,
      relations: relations ?? this.relations,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Media &&
        other.id == id &&
        other.title == title &&
        other.coverImage == coverImage &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.bannerImage == bannerImage &&
        other.season == season &&
        other.description == description &&
        other.type == type &&
        other.format == format &&
        other.countryOfOrigin == countryOfOrigin &&
        other.status == status &&
        other.episodes == episodes &&
        other.duration == duration &&
        other.chapters == chapters &&
        other.volumes == volumes &&
        listEquals(other.genres, genres) &&
        other.isAdult == isAdult &&
        other.averageScore == averageScore &&
        other.popularity == popularity &&
        other.mediaListEntry == mediaListEntry &&
        other.nextAiringEpisode == nextAiringEpisode &&
        other.studios == studios &&
        other.relations == relations;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        coverImage.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        bannerImage.hashCode ^
        season.hashCode ^
        description.hashCode ^
        type.hashCode ^
        format.hashCode ^
        countryOfOrigin.hashCode ^
        status.hashCode ^
        episodes.hashCode ^
        duration.hashCode ^
        chapters.hashCode ^
        volumes.hashCode ^
        genres.hashCode ^
        isAdult.hashCode ^
        averageScore.hashCode ^
        popularity.hashCode ^
        mediaListEntry.hashCode ^
        nextAiringEpisode.hashCode ^
        studios.hashCode ^
        relations.hashCode;
  }
}
