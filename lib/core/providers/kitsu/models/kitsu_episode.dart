import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:anikki/core/providers/kitsu/models/kitsu_episode_thumbnail.dart';
import 'package:anikki/core/providers/kitsu/models/kitsu_search_result/titles.dart';

class KitsuEpisode extends Equatable {
  const KitsuEpisode({
    this.createdAt,
    this.updatedAt,
    this.airdate,
    this.synopsis,
    this.description,
    this.titles,
    this.canonicalTitle,
    this.seasonNumber,
    this.relativeNumber,
    this.number,
    this.length,
    this.thumbnail,
  });

  final String? createdAt;
  final String? updatedAt;
  final String? airdate;
  final String? synopsis;
  final String? description;
  final Titles? titles;
  final String? canonicalTitle;
  final int? seasonNumber;
  final int? relativeNumber;
  final int? number;
  final int? length;
  final KitsuEpisodeThumbnail? thumbnail;

  KitsuEpisode copyWith({
    String? createdAt,
    String? updatedAt,
    String? airdate,
    String? synopsis,
    String? description,
    Titles? titles,
    String? canonicalTitle,
    int? seasonNumber,
    int? relativeNumber,
    int? number,
    int? length,
    KitsuEpisodeThumbnail? thumbnail,
  }) {
    return KitsuEpisode(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      airdate: airdate ?? this.airdate,
      synopsis: synopsis ?? this.synopsis,
      description: description ?? this.description,
      titles: titles ?? this.titles,
      canonicalTitle: canonicalTitle ?? this.canonicalTitle,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      relativeNumber: relativeNumber ?? this.relativeNumber,
      number: number ?? this.number,
      length: length ?? this.length,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'airdate': airdate,
      'synopsis': synopsis,
      'description': description,
      'titles': titles?.toMap(),
      'canonicalTitle': canonicalTitle,
      'seasonNumber': seasonNumber,
      'relativeNumber': relativeNumber,
      'number': number,
      'length': length,
      'thumbnail': thumbnail?.toMap(),
    };
  }

  factory KitsuEpisode.fromMap(Map<String, dynamic> map) {
    return KitsuEpisode(
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      airdate: map['airdate'] != null ? map['airdate'] as String : null,
      synopsis: map['synopsis'] != null ? map['synopsis'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      titles: map['titles'] != null ? Titles.fromMap(map['titles'] as Map<String,dynamic>) : null,
      canonicalTitle: map['canonicalTitle'] != null ? map['canonicalTitle'] as String : null,
      seasonNumber: map['seasonNumber'] != null ? map['seasonNumber'] as int : null,
      relativeNumber: map['relativeNumber'] != null ? map['relativeNumber'] as int : null,
      number: map['number'] != null ? map['number'] as int : null,
      length: map['length'] != null ? map['length'] as int : null,
      thumbnail: map['thumbnail'] != null ? KitsuEpisodeThumbnail.fromMap(map['thumbnail'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory KitsuEpisode.fromJson(String source) => KitsuEpisode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      createdAt,
      updatedAt,
      airdate,
      synopsis,
      description,
      titles,
      canonicalTitle,
      seasonNumber,
      relativeNumber,
      number,
      length,
      thumbnail,
    ];
  }
}
