import 'dart:convert';

import 'package:equatable/equatable.dart';

class File extends Equatable {
  final int? bytesCompleted;
  final int? length;
  final String? name;

  const File({this.bytesCompleted, this.length, this.name});

  factory File.fromMap(Map<String, dynamic> data) => File(
        bytesCompleted: data['bytesCompleted'] as int?,
        length: data['length'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'bytesCompleted': bytesCompleted,
        'length': length,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [File].
  factory File.fromJson(String data) {
    return File.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [File] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [bytesCompleted, length, name];
}
