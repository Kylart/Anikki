import 'dart:convert';

import 'package:equatable/equatable.dart';

class Torrent extends Equatable {
  final int? addedOn;
  final int? amountLeft;
  final bool? autoTmm;
  final double? availability;
  final String? category;
  final int? completed;
  final int? completionOn;
  final String? contentPath;
  final int? dlLimit;
  final int? dlspeed;
  final String? downloadPath;
  final int? downloaded;
  final int? downloadedSession;
  final int? eta;
  final bool? fLPiecePrio;
  final bool? forceStart;
  final String? hash;
  final String? infohashV1;
  final String? infohashV2;
  final int? lastActivity;
  final String? magnetUri;
  final int? maxRatio;
  final int? maxSeedingTime;
  final String? name;
  final int? numComplete;
  final int? numIncomplete;
  final int? numLeechs;
  final int? numSeeds;
  final int? priority;
  final double? progress;
  final double? ratio;
  final int? ratioLimit;
  final String? savePath;
  final int? seedingTime;
  final int? seedingTimeLimit;
  final int? seenComplete;
  final bool? seqDl;
  final int? size;
  final String? state;
  final bool? superSeeding;
  final String? tags;
  final int? timeActive;
  final int? totalSize;
  final String? tracker;
  final int? trackersCount;
  final int? upLimit;
  final int? uploaded;
  final int? uploadedSession;
  final int? upspeed;

  const Torrent({
    this.addedOn,
    this.amountLeft,
    this.autoTmm,
    this.availability,
    this.category,
    this.completed,
    this.completionOn,
    this.contentPath,
    this.dlLimit,
    this.dlspeed,
    this.downloadPath,
    this.downloaded,
    this.downloadedSession,
    this.eta,
    this.fLPiecePrio,
    this.forceStart,
    this.hash,
    this.infohashV1,
    this.infohashV2,
    this.lastActivity,
    this.magnetUri,
    this.maxRatio,
    this.maxSeedingTime,
    this.name,
    this.numComplete,
    this.numIncomplete,
    this.numLeechs,
    this.numSeeds,
    this.priority,
    this.progress,
    this.ratio,
    this.ratioLimit,
    this.savePath,
    this.seedingTime,
    this.seedingTimeLimit,
    this.seenComplete,
    this.seqDl,
    this.size,
    this.state,
    this.superSeeding,
    this.tags,
    this.timeActive,
    this.totalSize,
    this.tracker,
    this.trackersCount,
    this.upLimit,
    this.uploaded,
    this.uploadedSession,
    this.upspeed,
  });

  factory Torrent.fromMap(Map<String, dynamic> data) => Torrent(
        addedOn: data['added_on'] as int?,
        amountLeft: data['amount_left'] as int?,
        autoTmm: data['auto_tmm'] as bool?,
        availability: (data['availability'] as num?)?.toDouble(),
        category: data['category'] as String?,
        completed: data['completed'] as int?,
        completionOn: data['completion_on'] as int?,
        contentPath: data['content_path'] as String?,
        dlLimit: data['dl_limit'] as int?,
        dlspeed: data['dlspeed'] as int?,
        downloadPath: data['download_path'] as String?,
        downloaded: data['downloaded'] as int?,
        downloadedSession: data['downloaded_session'] as int?,
        eta: data['eta'] as int?,
        fLPiecePrio: data['f_l_piece_prio'] as bool?,
        forceStart: data['force_start'] as bool?,
        hash: data['hash'] as String?,
        infohashV1: data['infohash_v1'] as String?,
        infohashV2: data['infohash_v2'] as String?,
        lastActivity: data['last_activity'] as int?,
        magnetUri: data['magnet_uri'] as String?,
        maxRatio: data['max_ratio'] as int?,
        maxSeedingTime: data['max_seeding_time'] as int?,
        name: data['name'] as String?,
        numComplete: data['num_complete'] as int?,
        numIncomplete: data['num_incomplete'] as int?,
        numLeechs: data['num_leechs'] as int?,
        numSeeds: data['num_seeds'] as int?,
        priority: data['priority'] as int?,
        progress: (data['progress'] as num?)?.toDouble(),
        ratio: (data['ratio'] as num?)?.toDouble(),
        ratioLimit: data['ratio_limit'] as int?,
        savePath: data['save_path'] as String?,
        seedingTime: data['seeding_time'] as int?,
        seedingTimeLimit: data['seeding_time_limit'] as int?,
        seenComplete: data['seen_complete'] as int?,
        seqDl: data['seq_dl'] as bool?,
        size: data['size'] as int?,
        state: data['state'] as String?,
        superSeeding: data['super_seeding'] as bool?,
        tags: data['tags'] as String?,
        timeActive: data['time_active'] as int?,
        totalSize: data['total_size'] as int?,
        tracker: data['tracker'] as String?,
        trackersCount: data['trackers_count'] as int?,
        upLimit: data['up_limit'] as int?,
        uploaded: data['uploaded'] as int?,
        uploadedSession: data['uploaded_session'] as int?,
        upspeed: data['upspeed'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'added_on': addedOn,
        'amount_left': amountLeft,
        'auto_tmm': autoTmm,
        'availability': availability,
        'category': category,
        'completed': completed,
        'completion_on': completionOn,
        'content_path': contentPath,
        'dl_limit': dlLimit,
        'dlspeed': dlspeed,
        'download_path': downloadPath,
        'downloaded': downloaded,
        'downloaded_session': downloadedSession,
        'eta': eta,
        'f_l_piece_prio': fLPiecePrio,
        'force_start': forceStart,
        'hash': hash,
        'infohash_v1': infohashV1,
        'infohash_v2': infohashV2,
        'last_activity': lastActivity,
        'magnet_uri': magnetUri,
        'max_ratio': maxRatio,
        'max_seeding_time': maxSeedingTime,
        'name': name,
        'num_complete': numComplete,
        'num_incomplete': numIncomplete,
        'num_leechs': numLeechs,
        'num_seeds': numSeeds,
        'priority': priority,
        'progress': progress,
        'ratio': ratio,
        'ratio_limit': ratioLimit,
        'save_path': savePath,
        'seeding_time': seedingTime,
        'seeding_time_limit': seedingTimeLimit,
        'seen_complete': seenComplete,
        'seq_dl': seqDl,
        'size': size,
        'state': state,
        'super_seeding': superSeeding,
        'tags': tags,
        'time_active': timeActive,
        'total_size': totalSize,
        'tracker': tracker,
        'trackers_count': trackersCount,
        'up_limit': upLimit,
        'uploaded': uploaded,
        'uploaded_session': uploadedSession,
        'upspeed': upspeed,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Torrent].
  factory Torrent.fromJson(String data) {
    return Torrent.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Torrent] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      addedOn,
      amountLeft,
      autoTmm,
      availability,
      category,
      completed,
      completionOn,
      contentPath,
      dlLimit,
      dlspeed,
      downloadPath,
      downloaded,
      downloadedSession,
      eta,
      fLPiecePrio,
      forceStart,
      hash,
      infohashV1,
      infohashV2,
      lastActivity,
      magnetUri,
      maxRatio,
      maxSeedingTime,
      name,
      numComplete,
      numIncomplete,
      numLeechs,
      numSeeds,
      priority,
      progress,
      ratio,
      ratioLimit,
      savePath,
      seedingTime,
      seedingTimeLimit,
      seenComplete,
      seqDl,
      size,
      state,
      superSeeding,
      tags,
      timeActive,
      totalSize,
      tracker,
      trackersCount,
      upLimit,
      uploaded,
      uploadedSession,
      upspeed,
    ];
  }
}
