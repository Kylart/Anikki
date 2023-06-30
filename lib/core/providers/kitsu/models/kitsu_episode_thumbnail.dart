import 'dart:convert';

import 'package:equatable/equatable.dart';

class KitsuEpisodeThumbnail extends Equatable {
  const KitsuEpisodeThumbnail({
    this.original,
  });

  final String? original;

  KitsuEpisodeThumbnail copyWith({
    String? original,
  }) {
    return KitsuEpisodeThumbnail(
      original: original ?? this.original,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'original': original,
    };
  }

  factory KitsuEpisodeThumbnail.fromMap(Map<String, dynamic> map) {
    return KitsuEpisodeThumbnail(
      original: map['original'] != null ? map['original'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory KitsuEpisodeThumbnail.fromJson(String source) =>
      KitsuEpisodeThumbnail.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        if (original != null) original!,
      ];
}
