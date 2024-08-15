import 'dart:convert';

import 'package:equatable/equatable.dart';

class Season extends Equatable {
  final String? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  const Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory Season.fromMap(Map<String, dynamic> data) => Season(
        airDate: data['air_date'] as String?,
        episodeCount: data['episode_count'] as int?,
        id: data['id'] as int?,
        name: data['name'] as String?,
        overview: data['overview'] as String?,
        posterPath: data['poster_path'] as String?,
        seasonNumber: data['season_number'] as int?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'air_date': airDate,
        'episode_count': episodeCount,
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
        'season_number': seasonNumber,
        'vote_average': voteAverage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Season].
  factory Season.fromJson(String data) {
    return Season.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Season] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      airDate,
      episodeCount,
      id,
      name,
      overview,
      posterPath,
      seasonNumber,
      voteAverage,
    ];
  }
}
