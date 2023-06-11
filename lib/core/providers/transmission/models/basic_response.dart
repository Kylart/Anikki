import 'dart:convert';

import 'package:equatable/equatable.dart';

class BasicResponse extends Equatable {
  final String? result;
  final int? tag;

  const BasicResponse({this.result, this.tag});

  factory BasicResponse.fromMap(Map<String, dynamic> data) => BasicResponse(
        result: data['result'] as String?,
        tag: data['tag'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'result': result,
        'tag': tag,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BasicResponse].
  factory BasicResponse.fromJson(String data) {
    return BasicResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BasicResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [result, tag];
}
