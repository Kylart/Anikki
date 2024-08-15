import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:anikki/data/data.dart';
import 'package:anikki/data/tmdb/models/models.dart';

class Media extends Equatable {
  Media({
    Fragment$shortMedia? anilistInfo,
    this.tmdbInfo,
  }) {
    this.anilistInfo = anilistInfo ?? Fragment$shortMedia(id: 0);
  }

  late final Fragment$shortMedia anilistInfo;
  final TmdbTvDetails? tmdbInfo;

  bool get hasInfo => anilistInfo.id != 0;
  String? get title => anilistInfo.title?.userPreferred;
  String? get coverImage =>
      anilistInfo.coverImage?.extraLarge ??
      anilistInfo.coverImage?.large ??
      anilistInfo.coverImage?.medium;
  String? get bannerImage => anilistInfo.bannerImage;
  int? get numberOfEpisodes =>
      anilistInfo.episodes ?? anilistInfo.nextAiringEpisode?.episode;

  @override
  List<Object?> get props => [anilistInfo, tmdbInfo];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'anilistInfo': anilistInfo.toJson(),
      'tmdbInfo': tmdbInfo?.toJson(),
    };
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      anilistInfo: Fragment$shortMedia.fromJson(
        map['anilistInfo'] as Map<String, dynamic>,
      ),
      tmdbInfo: TmdbTvDetails.fromJson(
        map['tmdbInfo'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Media.fromJson(String source) =>
      Media.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  Media copyWith({
    Fragment$shortMedia? anilistInfo,
    TmdbTvDetails? tmdbInfo,
  }) {
    return Media(
      anilistInfo: anilistInfo ?? this.anilistInfo,
      tmdbInfo: tmdbInfo ?? this.tmdbInfo,
    );
  }
}
