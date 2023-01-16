import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'cover_image.dart';
import 'end_date.dart';
import 'next_airing_episode.dart';
import 'relations.dart';
import 'start_date.dart';
import 'studios.dart';
import 'title.dart';

@immutable
class Media {
  final int? id;
  final Title? title;
  final CoverImage? coverImage;
  final StartDate? startDate;
  final EndDate? endDate;
  final dynamic bannerImage;
  final String? season;
  final String? description;
  final String? type;
  final String? format;
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
    return 'Media(id: $id, title: $title, coverImage: $coverImage, startDate: $startDate, endDate: $endDate, bannerImage: $bannerImage, season: $season, description: $description, type: $type, format: $format, status: $status, episodes: $episodes, duration: $duration, chapters: $chapters, volumes: $volumes, genres: $genres, isAdult: $isAdult, averageScore: $averageScore, popularity: $popularity, mediaListEntry: $mediaListEntry, nextAiringEpisode: $nextAiringEpisode, studios: $studios, relations: $relations)';
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
            : StartDate.fromMap(data['startDate'] as Map<String, dynamic>),
        endDate: data['endDate'] == null
            ? null
            : EndDate.fromMap(data['endDate'] as Map<String, dynamic>),
        bannerImage: data['bannerImage'] as dynamic,
        season: data['season'] as String?,
        description: data['description'] as String?,
        type: data['type'] as String?,
        format: data['format'] as String?,
        status: data['status'] as String?,
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

  Map<String, dynamic> toMap() => {
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
    StartDate? startDate,
    EndDate? endDate,
    dynamic bannerImage,
    String? season,
    String? description,
    String? type,
    String? format,
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
    if (identical(other, this)) return true;
    if (other is! Media) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      coverImage.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      bannerImage.hashCode ^
      season.hashCode ^
      description.hashCode ^
      type.hashCode ^
      format.hashCode ^
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
