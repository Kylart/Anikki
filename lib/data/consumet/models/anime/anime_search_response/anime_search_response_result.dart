import 'dart:convert';

import 'package:equatable/equatable.dart';

class AnimeSearchResponseResult extends Equatable {
  final String? id;
  final String? title;
  final String? url;
  final String? image;
  final String? releaseDate;
  final String? subOrDub;

  const AnimeSearchResponseResult({
    this.id,
    this.title,
    this.url,
    this.image,
    this.releaseDate,
    this.subOrDub,
  });

  factory AnimeSearchResponseResult.fromMap(Map<String, dynamic> data) =>
      AnimeSearchResponseResult(
        id: data['id'] as String?,
        title: data['title'] as String?,
        url: data['url'] as String?,
        image: data['image'] as String?,
        releaseDate: data['releaseDate'] as String?,
        subOrDub: data['subOrDub'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'url': url,
        'image': image,
        'releaseDate': releaseDate,
        'subOrDub': subOrDub,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnimeSearchResponseResult].
  factory AnimeSearchResponseResult.fromJson(String data) {
    return AnimeSearchResponseResult.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnimeSearchResponseResult] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      url,
      image,
      releaseDate,
      subOrDub,
    ];
  }
}
