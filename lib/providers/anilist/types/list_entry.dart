import 'dart:convert';

import 'date.dart';
import 'media/media.dart';
import 'media_list_status.dart';

class AnilistListEntry {
  int? score;
  int? progress;
  AnilistMediaListStatus? status;
  String? notes;
  int? repeat;
  bool private;
  AnilistDate startedAt;
  AnilistDate completedAt;
  Media media;

  AnilistListEntry({
    this.score,
    this.progress,
    this.status,
    this.notes,
    this.repeat,
    required this.private,
    required this.startedAt,
    required this.completedAt,
    required this.media,
  });

  AnilistListEntry copyWith({
    int? score,
    int? progress,
    AnilistMediaListStatus? status,
    String? notes,
    int? repeat,
    bool? private,
    AnilistDate? startedAt,
    AnilistDate? completedAt,
    Media? media,
  }) {
    return AnilistListEntry(
      score: score ?? this.score,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      repeat: repeat ?? this.repeat,
      private: private ?? this.private,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      media: media ?? this.media,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'progress': progress,
      'status': status?.toString(),
      'notes': notes,
      'repeat': repeat,
      'private': private,
      'startedAt': startedAt.toMap(),
      'completedAt': completedAt.toMap(),
      'media': media.toMap(),
    };
  }

  factory AnilistListEntry.fromMap(Map<String, dynamic> map) {
    return AnilistListEntry(
      score: map['score']?.toInt(),
      progress: map['progress']?.toInt(),
      status: map['status'] != null
          ? AnilistMediaListStatus.values.byName(map['status'].toString().toLowerCase())
          : null,
      notes: map['notes'],
      repeat: map['repeat']?.toInt(),
      private: map['private'] ?? false,
      startedAt: AnilistDate.fromMap(map['startedAt']),
      completedAt: AnilistDate.fromMap(map['completedAt']),
      media: Media.fromMap(map['media']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnilistListEntry.fromJson(String source) =>
      AnilistListEntry.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnilistListEntry(score: $score, progress: $progress, status: $status, notes: $notes, repeat: $repeat, private: $private, startedAt: $startedAt, completedAt: $completedAt, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnilistListEntry &&
        other.score == score &&
        other.progress == progress &&
        other.status == status &&
        other.notes == notes &&
        other.repeat == repeat &&
        other.private == private &&
        other.startedAt == startedAt &&
        other.completedAt == completedAt &&
        other.media == media;
  }

  @override
  int get hashCode {
    return score.hashCode ^
        progress.hashCode ^
        status.hashCode ^
        notes.hashCode ^
        repeat.hashCode ^
        private.hashCode ^
        startedAt.hashCode ^
        completedAt.hashCode ^
        media.hashCode;
  }
}
