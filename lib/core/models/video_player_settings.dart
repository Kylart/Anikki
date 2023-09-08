import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideoPlayerSettings extends Equatable {
  const VideoPlayerSettings({
    this.inside = true,
  });

  final bool inside;

  VideoPlayerSettings copyWith({
    bool? inside,
  }) {
    return VideoPlayerSettings(
      inside: inside ?? this.inside,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inside': inside,
    };
  }

  factory VideoPlayerSettings.fromMap(Map<String, dynamic> map) {
    return VideoPlayerSettings(
      inside: map['inside'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoPlayerSettings.fromJson(String source) =>
      VideoPlayerSettings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [inside];
}
