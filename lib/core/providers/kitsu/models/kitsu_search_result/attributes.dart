import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'cover_image.dart';
import 'poster_image.dart';
import 'titles.dart';

class Attributes extends Equatable {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? slug;
  final String? synopsis;
  final String? description;
  final int? coverImageTopOffset;
  final Titles? titles;
  final String? canonicalTitle;
  final String? averageRating;
  final int? userCount;
  final int? favoritesCount;
  final String? startDate;
  final dynamic endDate;
  final dynamic nextRelease;
  final int? popularityRank;
  final int? ratingRank;
  final String? ageRating;
  final dynamic ageRatingGuide;
  final String? subtype;
  final String? status;
  final dynamic tba;
  final PosterImage? posterImage;
  final CoverImage? coverImage;
  final int? episodeCount;
  final dynamic episodeLength;
  final int? totalLength;
  final String? youtubeVideoId;
  final String? showType;
  final bool? nsfw;

  const Attributes({
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.synopsis,
    this.description,
    this.coverImageTopOffset,
    this.titles,
    this.canonicalTitle,
    this.averageRating,
    this.userCount,
    this.favoritesCount,
    this.startDate,
    this.endDate,
    this.nextRelease,
    this.popularityRank,
    this.ratingRank,
    this.ageRating,
    this.ageRatingGuide,
    this.subtype,
    this.status,
    this.tba,
    this.posterImage,
    this.coverImage,
    this.episodeCount,
    this.episodeLength,
    this.totalLength,
    this.youtubeVideoId,
    this.showType,
    this.nsfw,
  });

  factory Attributes.fromMap(Map<String, dynamic> data) => Attributes(
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        slug: data['slug'] as String?,
        synopsis: data['synopsis'] as String?,
        description: data['description'] as String?,
        coverImageTopOffset: data['coverImageTopOffset'] as int?,
        titles: data['titles'] == null
            ? null
            : Titles.fromMap(data['titles'] as Map<String, dynamic>),
        canonicalTitle: data['canonicalTitle'] as String?,
        averageRating: data['averageRating'] as String?,
        userCount: data['userCount'] as int?,
        favoritesCount: data['favoritesCount'] as int?,
        startDate: data['startDate'] as String?,
        endDate: data['endDate'] as dynamic,
        nextRelease: data['nextRelease'] as dynamic,
        popularityRank: data['popularityRank'] as int?,
        ratingRank: data['ratingRank'] as int?,
        ageRating: data['ageRating'] as String?,
        ageRatingGuide: data['ageRatingGuide'] as dynamic,
        subtype: data['subtype'] as String?,
        status: data['status'] as String?,
        tba: data['tba'] as dynamic,
        posterImage: data['posterImage'] == null
            ? null
            : PosterImage.fromMap(data['posterImage'] as Map<String, dynamic>),
        coverImage: data['coverImage'] == null
            ? null
            : CoverImage.fromMap(data['coverImage'] as Map<String, dynamic>),
        episodeCount: data['episodeCount'] as int?,
        episodeLength: data['episodeLength'] as dynamic,
        totalLength: data['totalLength'] as int?,
        youtubeVideoId: data['youtubeVideoId'] as String?,
        showType: data['showType'] as String?,
        nsfw: data['nsfw'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'slug': slug,
        'synopsis': synopsis,
        'description': description,
        'coverImageTopOffset': coverImageTopOffset,
        'titles': titles?.toMap(),
        'canonicalTitle': canonicalTitle,
        'averageRating': averageRating,
        'userCount': userCount,
        'favoritesCount': favoritesCount,
        'startDate': startDate,
        'endDate': endDate,
        'nextRelease': nextRelease,
        'popularityRank': popularityRank,
        'ratingRank': ratingRank,
        'ageRating': ageRating,
        'ageRatingGuide': ageRatingGuide,
        'subtype': subtype,
        'status': status,
        'tba': tba,
        'posterImage': posterImage?.toMap(),
        'coverImage': coverImage?.toMap(),
        'episodeCount': episodeCount,
        'episodeLength': episodeLength,
        'totalLength': totalLength,
        'youtubeVideoId': youtubeVideoId,
        'showType': showType,
        'nsfw': nsfw,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Attributes].
  factory Attributes.fromJson(String data) {
    return Attributes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Attributes] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      createdAt,
      updatedAt,
      slug,
      synopsis,
      description,
      coverImageTopOffset,
      titles,
      canonicalTitle,
      averageRating,
      userCount,
      favoritesCount,
      startDate,
      endDate,
      nextRelease,
      popularityRank,
      ratingRank,
      ageRating,
      ageRatingGuide,
      subtype,
      status,
      tba,
      posterImage,
      coverImage,
      episodeCount,
      episodeLength,
      totalLength,
      youtubeVideoId,
      showType,
      nsfw,
    ];
  }
}
