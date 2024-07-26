import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:anikki/app/home/features/home_timelines/models/timeline_type.dart';
import 'package:anikki/core/core.dart';

class TimelineEntry extends Equatable {
  /// [TimelineType] for this entry
  final TimelineType type;

  /// timestamp in milliseconds since epoch
  final int timestamp;

  /// Text that describe this entry
  final String? description;

  /// [Media] for this entry
  final Media media;

  const TimelineEntry({
    required this.type,
    required this.timestamp,
    this.description,
    required this.media,
  });

  @override
  List<Object?> get props => [
        type,
        timestamp,
        description,
        media,
      ];

  TimelineEntry copyWith({
    TimelineType? type,
    int? timestamp,
    String? action,
    Media? media,
    String? description,
  }) {
    return TimelineEntry(
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      description: action ?? this.description,
      media: media ?? this.media,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toString,
      'timestamp': timestamp,
      'action': description,
      'media': media.toMap(),
    };
  }

  factory TimelineEntry.fromMap(Map<String, dynamic> map) {
    return TimelineEntry(
      type: TimelineType.values.firstWhere((e) => e.toString() == map['type']),
      timestamp: map['timestamp'] as int,
      description: map['action'] != null ? map['action'] as String : null,
      media: Media.fromMap(map['media'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TimelineEntry.fromJson(String source) =>
      TimelineEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
