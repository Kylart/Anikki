import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'arguments.dart';

class TorrentGet extends Equatable {
  final Arguments? arguments;
  final String? result;
  final int? tag;

  const TorrentGet({this.arguments, this.result, this.tag});

  factory TorrentGet.fromMap(Map<String, dynamic> data) => TorrentGet(
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
  /// Parses the string and returns the resulting Json object as [TorrentGet].
  factory TorrentGet.fromJson(String data) {
    return TorrentGet.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TorrentGet] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [arguments, result, tag];
}
