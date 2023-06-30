import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'arguments.dart';

class SessionGet extends Equatable {
  final Arguments? arguments;
  final String? result;
  final int? tag;

  const SessionGet({
    this.arguments,
    this.result,
    this.tag,
  });

  factory SessionGet.fromMap(Map<String, dynamic> data) => SessionGet(
        arguments: data['arguments'] == null
            ? null
            : Arguments.fromMap(data['arguments'] as Map<String, dynamic>),
        result: data['result'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'arguments': arguments?.toMap(),
        'result': result,
        'tag': tag,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SessionGet].
  factory SessionGet.fromJson(String data) {
    return SessionGet.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SessionGet] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        arguments,
        result,
        tag,
      ];
}
