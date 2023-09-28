import 'dart:convert';

import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String? url;
  final bool? isM3U8;
  final String? quality;

  const Source({this.url, this.isM3U8, this.quality});

  factory Source.fromMap(Map<String, dynamic> data) => Source(
        url: data['url'] as String?,
        isM3U8: data['isM3U8'] as bool?,
        quality: data['quality'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'isM3U8': isM3U8,
        'quality': quality,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Source].
  factory Source.fromJson(String data) {
    return Source.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Source] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, isM3U8, quality];
}
