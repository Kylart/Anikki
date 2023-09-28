import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'episode.dart';

class AnimeInfoResponse extends Equatable {
  final String? id;
  final String? title;
  final String? url;
  final List<String>? genres;
  final int? totalEpisodes;
  final String? image;
  final String? releaseDate;
  final String? description;
  final String? subOrDub;
  final String? type;
  final String? status;
  final String? otherName;
  final List<Episode>? episodes;

  const AnimeInfoResponse({
    this.id,
    this.title,
    this.url,
    this.genres,
    this.totalEpisodes,
    this.image,
    this.releaseDate,
    this.description,
    this.subOrDub,
    this.type,
    this.status,
    this.otherName,
    this.episodes,
  });

  factory AnimeInfoResponse.fromMap(Map<String, dynamic> data) {
    return AnimeInfoResponse(
      id: data['id'] as String?,
      title: data['title'] as String?,
      url: data['url'] as String?,
      genres: data['genres'] as List<String>?,
      totalEpisodes: data['totalEpisodes'] as int?,
      image: data['image'] as String?,
      releaseDate: data['releaseDate'] as String?,
      description: data['description'] as String?,
      subOrDub: data['subOrDub'] as String?,
      type: data['type'] as String?,
      status: data['status'] as String?,
      otherName: data['otherName'] as String?,
      episodes: (data['episodes'] as List<dynamic>?)
          ?.map((e) => Episode.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'url': url,
        'genres': genres,
        'totalEpisodes': totalEpisodes,
        'image': image,
        'releaseDate': releaseDate,
        'description': description,
        'subOrDub': subOrDub,
        'type': type,
        'status': status,
        'otherName': otherName,
        'episodes': episodes?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnimeInfoResponse].
  factory AnimeInfoResponse.fromJson(String data) {
    return AnimeInfoResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnimeInfoResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      url,
      genres,
      totalEpisodes,
      image,
      releaseDate,
      description,
      subOrDub,
      type,
      status,
      otherName,
      episodes,
    ];
  }
}
