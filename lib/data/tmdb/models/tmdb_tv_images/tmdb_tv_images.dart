import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'backdrop.dart';
import 'logo.dart';
import 'poster.dart';

class TmdbTvImages extends Equatable {
  final List<Backdrop>? backdrops;
  final int? id;
  final List<Logo>? logos;
  final List<Poster>? posters;

  const TmdbTvImages({this.backdrops, this.id, this.logos, this.posters});

  factory TmdbTvImages.fromMap(Map<String, dynamic> data) => TmdbTvImages(
        backdrops: (data['backdrops'] as List<dynamic>?)
            ?.map((e) => Backdrop.fromMap(e as Map<String, dynamic>))
            .toList(),
        id: data['id'] as int?,
        logos: (data['logos'] as List<dynamic>?)
            ?.map((e) => Logo.fromMap(e as Map<String, dynamic>))
            .toList(),
        posters: (data['posters'] as List<dynamic>?)
            ?.map((e) => Poster.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'backdrops': backdrops?.map((e) => e.toMap()).toList(),
        'id': id,
        'logos': logos?.map((e) => e.toMap()).toList(),
        'posters': posters?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TmdbTvImages].
  factory TmdbTvImages.fromJson(String data) {
    return TmdbTvImages.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TmdbTvImages] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [backdrops, id, logos, posters];
}
