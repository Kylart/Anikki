import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/helpers/anilist/anilist_utils.dart';
import 'package:anikki/data/data.dart';

class Media extends Equatable {
  Media({
    Fragment$media? anilistInfo,
    this.tmdbInfo,
  }) {
    this.anilistInfo = anilistInfo ?? AnilistUtils.getEmptyMedia();
  }

  late final Fragment$media anilistInfo;
  final TmdbTvDetails? tmdbInfo;

  bool get hasInfo => anilistInfo.id != 0;
  String? get title => anilistInfo.title?.userPreferred;
  String? get coverImage =>
      anilistInfo.coverImage?.extraLarge ??
      anilistInfo.coverImage?.large ??
      anilistInfo.coverImage?.medium;
  String? get bannerImage => anilistInfo.bannerImage;
  String? get backgroundImage {
    final images = tmdbInfo?.images?.backdrops;

    if (images != null && images.isNotEmpty) {
      return getTmdbImageUrl(images.first.filePath!);
    }

    return bannerImage ?? coverImage;
  }

  String? get posterImage {
    final images = tmdbInfo?.images?.posters;

    if (images != null && images.isNotEmpty) {
      final jpImage = images.firstWhereOrNull((image) => image.iso6391 == 'ja');
      final enImage = images.firstWhereOrNull((image) => image.iso6391 == 'en');

      if (jpImage?.filePath != null) {
        return getTmdbImageUrl(jpImage!.filePath!);
      }

      if (enImage?.filePath != null) {
        return getTmdbImageUrl(enImage!.filePath!);
      }

      return getTmdbImageUrl(images.first.filePath!);
    }

    return coverImage;
  }

  int? get numberOfEpisodes =>
      anilistInfo.episodes ?? anilistInfo.nextAiringEpisode?.episode;

  TmdbTvImages? get images => tmdbInfo?.images;

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
      anilistInfo: Fragment$media.fromJson(
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
    Fragment$media? anilistInfo,
    TmdbTvDetails? tmdbInfo,
  }) {
    return Media(
      anilistInfo: anilistInfo ?? this.anilistInfo,
      tmdbInfo: tmdbInfo ?? this.tmdbInfo,
    );
  }
}
