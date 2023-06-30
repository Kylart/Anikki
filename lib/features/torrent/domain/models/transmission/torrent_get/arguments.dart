import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'torrent.dart';

class Arguments extends Equatable {
  final List<Torrent>? torrents;

  const Arguments({this.torrents});

  factory Arguments.fromMap(Map<String, dynamic> data) => Arguments(
        torrents: (data['torrents'] as List<dynamic>?)
            ?.map((e) => Torrent.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'torrents': torrents?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Arguments].
  factory Arguments.fromJson(String data) {
    return Arguments.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Arguments] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [torrents];
}
