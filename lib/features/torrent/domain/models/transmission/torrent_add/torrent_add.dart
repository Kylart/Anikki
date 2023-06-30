import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'arguments.dart';

class TorrentAdd extends Equatable {
  final Arguments? arguments;
  final String? result;
  final int? tag;

  const TorrentAdd({this.arguments, this.result, this.tag});

  factory TorrentAdd.fromMap(Map<String, dynamic> data) => TorrentAdd(
        arguments: data['arguments'] == null
            ? null
            : Arguments.fromMap(data['arguments'] as Map<String, dynamic>),
        result: data['result'] as String?,
        tag: data['tag'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'arguments': arguments?.toMap(),
        'result': result,
        'tag': tag,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TorrentAdd].
  factory TorrentAdd.fromJson(String data) {
    return TorrentAdd.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TorrentAdd] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [arguments, result, tag];
}
