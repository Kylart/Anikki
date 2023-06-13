import 'dart:convert';

import 'package:equatable/equatable.dart';

class PeersFrom extends Equatable {
  final int? fromCache;
  final int? fromDht;
  final int? fromIncoming;
  final int? fromLpd;
  final int? fromLtep;
  final int? fromPex;
  final int? fromTracker;

  const PeersFrom({
    this.fromCache,
    this.fromDht,
    this.fromIncoming,
    this.fromLpd,
    this.fromLtep,
    this.fromPex,
    this.fromTracker,
  });

  factory PeersFrom.fromMap(Map<String, dynamic> data) => PeersFrom(
        fromCache: data['fromCache'] as int?,
        fromDht: data['fromDht'] as int?,
        fromIncoming: data['fromIncoming'] as int?,
        fromLpd: data['fromLpd'] as int?,
        fromLtep: data['fromLtep'] as int?,
        fromPex: data['fromPex'] as int?,
        fromTracker: data['fromTracker'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'fromCache': fromCache,
        'fromDht': fromDht,
        'fromIncoming': fromIncoming,
        'fromLpd': fromLpd,
        'fromLtep': fromLtep,
        'fromPex': fromPex,
        'fromTracker': fromTracker,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PeersFrom].
  factory PeersFrom.fromJson(String data) {
    return PeersFrom.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PeersFrom] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      fromCache,
      fromDht,
      fromIncoming,
      fromLpd,
      fromLtep,
      fromPex,
      fromTracker,
    ];
  }
}
