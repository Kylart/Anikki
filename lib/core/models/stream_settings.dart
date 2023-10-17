import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

enum StreamRequestType {
  online('Online'),
  torrent('Torrent'),
  choose('Let me choose');

  final String title;

  const StreamRequestType(this.title);
}

class StreamSettings extends Equatable {
  const StreamSettings({
    this.streamRequestType = StreamRequestType.online,
  });

  final StreamRequestType streamRequestType;

  StreamSettings copyWith({
    StreamRequestType? streamRequestType,
  }) {
    return StreamSettings(
      streamRequestType: streamRequestType ?? this.streamRequestType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'streamRequestType': streamRequestType.toString(),
    };
  }

  factory StreamSettings.fromMap(Map<String, dynamic> map) {
    return StreamSettings(
      streamRequestType: StreamRequestType.values.firstWhereOrNull(
            (element) => element.toString() == map['streamRequestType'],
          ) ??
          StreamRequestType.choose,
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamSettings.fromJson(String source) =>
      StreamSettings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        streamRequestType,
      ];
}
