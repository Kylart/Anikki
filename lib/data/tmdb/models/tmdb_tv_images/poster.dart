import 'dart:convert';

import 'package:equatable/equatable.dart';

class Poster extends Equatable {
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const Poster({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Poster.fromMap(Map<String, dynamic> data) => Poster(
        aspectRatio: (data['aspect_ratio'] as num?)?.toDouble(),
        height: data['height'] as int?,
        iso6391: data['iso_639_1'] as String?,
        filePath: data['file_path'] as String?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
        voteCount: data['vote_count'] as int?,
        width: data['width'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'aspect_ratio': aspectRatio,
        'height': height,
        'iso_639_1': iso6391,
        'file_path': filePath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'width': width,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Poster].
  factory Poster.fromJson(String data) {
    return Poster.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Poster] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      aspectRatio,
      height,
      iso6391,
      filePath,
      voteAverage,
      voteCount,
      width,
    ];
  }
}
