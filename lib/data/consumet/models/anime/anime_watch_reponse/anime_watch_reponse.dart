import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'headers.dart';
import 'source.dart';

class AnimeWatchReponse extends Equatable {
  final Headers? headers;
  final List<Source>? sources;
  final String? download;

  const AnimeWatchReponse({this.headers, this.sources, this.download});

  factory AnimeWatchReponse.fromMap(Map<String, dynamic> data) {
    return AnimeWatchReponse(
      headers: data['headers'] == null
          ? null
          : Headers.fromMap(data['headers'] as Map<String, dynamic>),
      sources: (data['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromMap(e as Map<String, dynamic>))
          .toList(),
      download: data['download'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'headers': headers?.toMap(),
        'sources': sources?.map((e) => e.toMap()).toList(),
        'download': download,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnimeWatchReponse].
  factory AnimeWatchReponse.fromJson(String data) {
    return AnimeWatchReponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnimeWatchReponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [headers, sources, download];
}
