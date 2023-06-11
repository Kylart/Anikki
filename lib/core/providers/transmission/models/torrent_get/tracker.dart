import 'dart:convert';

import 'package:equatable/equatable.dart';

class Tracker extends Equatable {
  final String? announce;
  final int? id;
  final String? scrape;
  final String? sitename;
  final int? tier;

  const Tracker({
    this.announce,
    this.id,
    this.scrape,
    this.sitename,
    this.tier,
  });

  factory Tracker.fromMap(Map<String, dynamic> data) => Tracker(
        announce: data['announce'] as String?,
        id: data['id'] as int?,
        scrape: data['scrape'] as String?,
        sitename: data['sitename'] as String?,
        tier: data['tier'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'announce': announce,
        'id': id,
        'scrape': scrape,
        'sitename': sitename,
        'tier': tier,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tracker].
  factory Tracker.fromJson(String data) {
    return Tracker.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tracker] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [announce, id, scrape, sitename, tier];
}
