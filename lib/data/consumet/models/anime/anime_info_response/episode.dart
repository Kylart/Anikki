import 'dart:convert';

import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final String? id;
  final double? number;
  final String? url;

  const Episode({this.id, this.number, this.url});

  factory Episode.fromMap(Map<String, dynamic> data) => Episode(
        id: data['id'] as String?,
        number: (data['number'] as num?)?.toDouble(),
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'number': number,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Episode].
  factory Episode.fromJson(String data) {
    return Episode.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Episode] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, number, url];
}
