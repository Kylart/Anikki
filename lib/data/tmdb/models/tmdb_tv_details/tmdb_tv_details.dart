// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:anikki/data/tmdb/models/models.dart';

import 'genre.dart';
import 'last_episode_to_air.dart';
import 'network.dart';
import 'next_episode_to_air.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'season.dart';
import 'spoken_language.dart';

class TmdbTvDetails extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<dynamic>? createdBy;
  final List<int>? episodeRunTime;
  final String? firstAirDate;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String>? languages;
  final String? lastAirDate;
  final LastEpisodeToAir? lastEpisodeToAir;
  final String? name;
  final NextEpisodeToAir? nextEpisodeToAir;
  final List<Network>? networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final List<Season>? seasons;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;
  final TmdbTvImages? images;

  const TmdbTvDetails({
    this.images,
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  factory TmdbTvDetails.fromMap(Map<String, dynamic> data) => TmdbTvDetails(
        images: data['images'] == null
            ? null
            : TmdbTvImages.fromMap(data['images'] as Map<String, dynamic>),
        adult: data['adult'] as bool?,
        backdropPath: data['backdrop_path'] as String?,
        createdBy: data['created_by'] as List<dynamic>?,
        episodeRunTime: data['episode_run_time'].cast<int>() as List<int>?,
        firstAirDate: data['first_air_date'] as String?,
        genres: (data['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
        homepage: data['homepage'] as String?,
        id: data['id'].toInt() as int?,
        inProduction: data['in_production'] as bool?,
        languages: data['languages'].cast<String>() as List<String>?,
        lastAirDate: data['last_air_date'] as String?,
        lastEpisodeToAir: data['last_episode_to_air'] == null
            ? null
            : LastEpisodeToAir.fromMap(
                data['last_episode_to_air'] as Map<String, dynamic>),
        name: data['name'] as String?,
        nextEpisodeToAir: data['next_episode_to_air'] == null
            ? null
            : NextEpisodeToAir.fromMap(
                data['next_episode_to_air'] as Map<String, dynamic>),
        networks: (data['networks'] as List<dynamic>?)
            ?.map((e) => Network.fromMap(e as Map<String, dynamic>))
            .toList(),
        numberOfEpisodes: data['number_of_episodes'].toInt() as int?,
        numberOfSeasons: data['number_of_seasons'].toInt() as int?,
        originCountry: data['origin_country'].cast<String>() as List<String>?,
        originalLanguage: data['original_language'] as String?,
        originalName: data['original_name'] as String?,
        overview: data['overview'] as String?,
        popularity: (data['popularity'] as num?)?.toDouble(),
        posterPath: data['poster_path'] as String?,
        productionCompanies: (data['production_companies'] as List<dynamic>?)
            ?.map((e) => ProductionCompany.fromMap(e as Map<String, dynamic>))
            .toList(),
        productionCountries: (data['production_countries'] as List<dynamic>?)
            ?.map((e) => ProductionCountry.fromMap(e as Map<String, dynamic>))
            .toList(),
        seasons: (data['seasons'] as List<dynamic>?)
            ?.map((e) => Season.fromMap(e as Map<String, dynamic>))
            .toList(),
        spokenLanguages: (data['spoken_languages'] as List<dynamic>?)
            ?.map((e) => SpokenLanguage.fromMap(e as Map<String, dynamic>))
            .toList(),
        status: data['status'] as String?,
        tagline: data['tagline'] as String?,
        type: data['type'] as String?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
        voteCount: data['vote_count'].toInt() as int?,
      );

  Map<String, dynamic> toMap() => {
        'images': images?.toMap(),
        'adult': adult,
        'backdrop_path': backdropPath,
        'created_by': createdBy,
        'episode_run_time': episodeRunTime,
        'first_air_date': firstAirDate,
        'genres': genres?.map((e) => e.toMap()).toList(),
        'homepage': homepage,
        'id': id,
        'in_production': inProduction,
        'languages': languages,
        'last_air_date': lastAirDate,
        'last_episode_to_air': lastEpisodeToAir?.toMap(),
        'name': name,
        'next_episode_to_air': nextEpisodeToAir?.toMap(),
        'networks': networks?.map((e) => e.toMap()).toList(),
        'number_of_episodes': numberOfEpisodes,
        'number_of_seasons': numberOfSeasons,
        'origin_country': originCountry,
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'production_companies':
            productionCompanies?.map((e) => e.toMap()).toList(),
        'production_countries':
            productionCountries?.map((e) => e.toMap()).toList(),
        'seasons': seasons?.map((e) => e.toMap()).toList(),
        'spoken_languages': spokenLanguages?.map((e) => e.toMap()).toList(),
        'status': status,
        'tagline': tagline,
        'type': type,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TmdbTvDetails].
  factory TmdbTvDetails.fromJson(String data) {
    return TmdbTvDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TmdbTvDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      images,
      adult,
      backdropPath,
      createdBy,
      episodeRunTime,
      firstAirDate,
      genres,
      homepage,
      id,
      inProduction,
      languages,
      lastAirDate,
      lastEpisodeToAir,
      name,
      nextEpisodeToAir,
      networks,
      numberOfEpisodes,
      numberOfSeasons,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      productionCompanies,
      productionCountries,
      seasons,
      spokenLanguages,
      status,
      tagline,
      type,
      voteAverage,
      voteCount,
    ];
  }

  TmdbTvDetails copyWith({
    bool? adult,
    String? backdropPath,
    List<dynamic>? createdBy,
    List<int>? episodeRunTime,
    String? firstAirDate,
    List<Genre>? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    String? lastAirDate,
    LastEpisodeToAir? lastEpisodeToAir,
    String? name,
    NextEpisodeToAir? nextEpisodeToAir,
    List<Network>? networks,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    List<Season>? seasons,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
    TmdbTvImages? images,
  }) {
    return TmdbTvDetails(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      createdBy: createdBy ?? this.createdBy,
      episodeRunTime: episodeRunTime ?? this.episodeRunTime,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      inProduction: inProduction ?? this.inProduction,
      languages: languages ?? this.languages,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      lastEpisodeToAir: lastEpisodeToAir ?? this.lastEpisodeToAir,
      name: name ?? this.name,
      nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
      networks: networks ?? this.networks,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      seasons: seasons ?? this.seasons,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      type: type ?? this.type,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      images: images ?? this.images,
    );
  }
}
