import 'dart:convert';

import 'package:equatable/equatable.dart';

class TorrentAdded extends Equatable {
  final String? hashString;
  final int? id;
  final String? name;

  const TorrentAdded({this.hashString, this.id, this.name});

  factory TorrentAdded.fromMap(Map<String, dynamic> data) => TorrentAdded(
        hashString: data['hashString'] as String?,
        id: data['id'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'hashString': hashString,
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TorrentAdded].
  factory TorrentAdded.fromJson(String data) {
    return TorrentAdded.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TorrentAdded] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [hashString, id, name];
}
