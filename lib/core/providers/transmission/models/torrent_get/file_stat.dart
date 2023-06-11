import 'dart:convert';

import 'package:equatable/equatable.dart';

class FileStat extends Equatable {
  final int? bytesCompleted;
  final int? priority;
  final bool? wanted;

  const FileStat({this.bytesCompleted, this.priority, this.wanted});

  factory FileStat.fromMap(Map<String, dynamic> data) => FileStat(
        bytesCompleted: data['bytesCompleted'] as int?,
        priority: data['priority'] as int?,
        wanted: data['wanted'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'bytesCompleted': bytesCompleted,
        'priority': priority,
        'wanted': wanted,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FileStat].
  factory FileStat.fromJson(String data) {
    return FileStat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FileStat] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [bytesCompleted, priority, wanted];
}
