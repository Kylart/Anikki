import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'torrent_added.dart';

class Arguments extends Equatable {
  final TorrentAdded? torrentAdded;

  const Arguments({this.torrentAdded});

  factory Arguments.fromMap(Map<String, dynamic> data) => Arguments(
        torrentAdded: data['torrent-added'] == null
            ? null
            : TorrentAdded.fromMap(
                data['torrent-added'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'torrent-added': torrentAdded?.toMap(),
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
  List<Object?> get props => [torrentAdded];
}
