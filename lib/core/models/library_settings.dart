import 'dart:convert';

import 'package:equatable/equatable.dart';

class LibrarySettings extends Equatable {
  const LibrarySettings({
    this.path = '',
    this.recursive = true,
  });

  final String path;
  final bool recursive;

  LibrarySettings copyWith({
    String? path,
    bool? recursive,
  }) {
    return LibrarySettings(
      path: path ?? this.path,
      recursive: recursive ?? this.recursive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'recursive': recursive,
    };
  }

  factory LibrarySettings.fromMap(Map<String, dynamic> map) {
    return LibrarySettings(
      path: map['path'] as String,
      recursive: map['recursive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LibrarySettings.fromJson(String source) =>
      LibrarySettings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        path,
        recursive,
      ];
}
