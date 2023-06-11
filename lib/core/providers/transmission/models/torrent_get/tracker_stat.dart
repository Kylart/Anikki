import 'dart:convert';

import 'package:equatable/equatable.dart';

class TrackerStat extends Equatable {
  final String? announce;
  final int? announceState;
  final int? downloadCount;
  final bool? hasAnnounced;
  final bool? hasScraped;
  final String? host;
  final int? id;
  final bool? isBackup;
  final int? lastAnnouncePeerCount;
  final String? lastAnnounceResult;
  final int? lastAnnounceStartTime;
  final bool? lastAnnounceSucceeded;
  final int? lastAnnounceTime;
  final bool? lastAnnounceTimedOut;
  final String? lastScrapeResult;
  final int? lastScrapeStartTime;
  final bool? lastScrapeSucceeded;
  final int? lastScrapeTime;
  final bool? lastScrapeTimedOut;
  final int? leecherCount;
  final int? nextAnnounceTime;
  final int? nextScrapeTime;
  final String? scrape;
  final int? scrapeState;
  final int? seederCount;
  final String? sitename;
  final int? tier;

  const TrackerStat({
    this.announce,
    this.announceState,
    this.downloadCount,
    this.hasAnnounced,
    this.hasScraped,
    this.host,
    this.id,
    this.isBackup,
    this.lastAnnouncePeerCount,
    this.lastAnnounceResult,
    this.lastAnnounceStartTime,
    this.lastAnnounceSucceeded,
    this.lastAnnounceTime,
    this.lastAnnounceTimedOut,
    this.lastScrapeResult,
    this.lastScrapeStartTime,
    this.lastScrapeSucceeded,
    this.lastScrapeTime,
    this.lastScrapeTimedOut,
    this.leecherCount,
    this.nextAnnounceTime,
    this.nextScrapeTime,
    this.scrape,
    this.scrapeState,
    this.seederCount,
    this.sitename,
    this.tier,
  });

  factory TrackerStat.fromMap(Map<String, dynamic> data) => TrackerStat(
        announce: data['announce'] as String?,
        announceState: data['announceState'] as int?,
        downloadCount: data['downloadCount'] as int?,
        hasAnnounced: data['hasAnnounced'] as bool?,
        hasScraped: data['hasScraped'] as bool?,
        host: data['host'] as String?,
        id: data['id'] as int?,
        isBackup: data['isBackup'] as bool?,
        lastAnnouncePeerCount: data['lastAnnouncePeerCount'] as int?,
        lastAnnounceResult: data['lastAnnounceResult'] as String?,
        lastAnnounceStartTime: data['lastAnnounceStartTime'] as int?,
        lastAnnounceSucceeded: data['lastAnnounceSucceeded'] as bool?,
        lastAnnounceTime: data['lastAnnounceTime'] as int?,
        lastAnnounceTimedOut: data['lastAnnounceTimedOut'] as bool?,
        lastScrapeResult: data['lastScrapeResult'] as String?,
        lastScrapeStartTime: data['lastScrapeStartTime'] as int?,
        lastScrapeSucceeded: data['lastScrapeSucceeded'] as bool?,
        lastScrapeTime: data['lastScrapeTime'] as int?,
        lastScrapeTimedOut: data['lastScrapeTimedOut'] as bool?,
        leecherCount: data['leecherCount'] as int?,
        nextAnnounceTime: data['nextAnnounceTime'] as int?,
        nextScrapeTime: data['nextScrapeTime'] as int?,
        scrape: data['scrape'] as String?,
        scrapeState: data['scrapeState'] as int?,
        seederCount: data['seederCount'] as int?,
        sitename: data['sitename'] as String?,
        tier: data['tier'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'announce': announce,
        'announceState': announceState,
        'downloadCount': downloadCount,
        'hasAnnounced': hasAnnounced,
        'hasScraped': hasScraped,
        'host': host,
        'id': id,
        'isBackup': isBackup,
        'lastAnnouncePeerCount': lastAnnouncePeerCount,
        'lastAnnounceResult': lastAnnounceResult,
        'lastAnnounceStartTime': lastAnnounceStartTime,
        'lastAnnounceSucceeded': lastAnnounceSucceeded,
        'lastAnnounceTime': lastAnnounceTime,
        'lastAnnounceTimedOut': lastAnnounceTimedOut,
        'lastScrapeResult': lastScrapeResult,
        'lastScrapeStartTime': lastScrapeStartTime,
        'lastScrapeSucceeded': lastScrapeSucceeded,
        'lastScrapeTime': lastScrapeTime,
        'lastScrapeTimedOut': lastScrapeTimedOut,
        'leecherCount': leecherCount,
        'nextAnnounceTime': nextAnnounceTime,
        'nextScrapeTime': nextScrapeTime,
        'scrape': scrape,
        'scrapeState': scrapeState,
        'seederCount': seederCount,
        'sitename': sitename,
        'tier': tier,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TrackerStat].
  factory TrackerStat.fromJson(String data) {
    return TrackerStat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TrackerStat] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      announce,
      announceState,
      downloadCount,
      hasAnnounced,
      hasScraped,
      host,
      id,
      isBackup,
      lastAnnouncePeerCount,
      lastAnnounceResult,
      lastAnnounceStartTime,
      lastAnnounceSucceeded,
      lastAnnounceTime,
      lastAnnounceTimedOut,
      lastScrapeResult,
      lastScrapeStartTime,
      lastScrapeSucceeded,
      lastScrapeTime,
      lastScrapeTimedOut,
      leecherCount,
      nextAnnounceTime,
      nextScrapeTime,
      scrape,
      scrapeState,
      seederCount,
      sitename,
      tier,
    ];
  }
}
