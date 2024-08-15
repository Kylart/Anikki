import 'dart:convert';

import 'package:equatable/equatable.dart';

class LastEpisodeToAir extends Equatable {
  final int? id;
  final String? name;
  final String? overview;
  final int? voteAverage;
  final int? voteCount;
  final String? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;

  const LastEpisodeToAir({
    this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  factory LastEpisodeToAir.fromMap(Map<String, dynamic> data) {
    return LastEpisodeToAir(
      id: data['id']?.toInt() as int?,
      name: data['name'] as String?,
      overview: data['overview'] as String?,
      voteAverage: data['vote_average']?.toInt() as int?,
      voteCount: data['vote_count']?.toInt() as int?,
      airDate: data['air_date'] as String?,
      episodeNumber: data['episode_number']?.toInt() as int?,
      episodeType: data['episode_type'] as String?,
      productionCode: data['production_code'] as String?,
      runtime: data['runtime']?.toInt() as int?,
      seasonNumber: data['season_number']?.toInt() as int?,
      showId: data['show_id']?.toInt() as int?,
      stillPath: data['still_path'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'overview': overview,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'air_date': airDate,
        'episode_number': episodeNumber,
        'episode_type': episodeType,
        'production_code': productionCode,
        'runtime': runtime,
        'season_number': seasonNumber,
        'show_id': showId,
        'still_path': stillPath,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LastEpisodeToAir].
  factory LastEpisodeToAir.fromJson(String data) {
    return LastEpisodeToAir.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LastEpisodeToAir] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      overview,
      voteAverage,
      voteCount,
      airDate,
      episodeNumber,
      episodeType,
      productionCode,
      runtime,
      seasonNumber,
      showId,
      stillPath,
    ];
  }
}
