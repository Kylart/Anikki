import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'file.dart';
import 'file_stat.dart';
import 'peer.dart';
import 'peers_from.dart';
import 'tracker.dart';
import 'tracker_stat.dart';

class Torrent extends Equatable {
  final int? activityDate;
  final int? addedDate;
  final List<int>? availability;
  final int? bandwidthPriority;
  final String? comment;
  final int? corruptEver;
  final String? creator;
  final int? dateCreated;
  final int? desiredAvailable;
  final int? doneDate;
  final String? downloadDir;
  final int? downloadLimit;
  final bool? downloadLimited;
  final int? downloadedEver;
  final int? editDate;
  final int? error;
  final int? eta;
  final int? etaIdle;
  final int? fileCount;
  final List<FileStat>? fileStats;
  final List<File>? files;
  final String? group;
  final int? haveUnchecked;
  final int? haveValid;
  final bool? honorsSessionLimits;
  final int? id;
  final bool? isFinished;
  final bool? isPrivate;
  final bool? isStalled;
  final List<dynamic>? labels;
  final int? leftUntilDone;
  final String? magnetLink;
  final int? manualAnnounceTime;
  final int? maxConnectedPeers;
  final int? metadataPercentComplete;
  final String? name;
  final int? peerLimit;
  final List<Peer>? peers;
  final int? peersConnected;
  final PeersFrom? peersFrom;
  final int? peersGettingFromUs;
  final int? peersSendingToUs;
  final int? percentComplete;
  final int? percentDone;
  final int? pieceCount;
  final int? pieceSize;
  final String? pieces;
  final String? primaryMimeType;
  final List<int>? priorities;
  final int? queuePosition;
  final int? rateDownload;
  final int? rateUpload;
  final int? recheckProgress;
  final int? secondsDownloading;
  final int? secondsSeeding;
  final int? seedIdleLimit;
  final int? seedIdleMode;
  final int? seedRatioLimit;
  final int? seedRatioMode;
  final int? sizeWhenDone;
  final int? startDate;
  final int? status;
  final String? torrentFile;
  final int? totalSize;
  final String? trackerList;
  final List<TrackerStat>? trackerStats;
  final List<Tracker>? trackers;
  final int? uploadLimit;
  final bool? uploadLimited;
  final double? uploadRatio;
  final int? uploadedEver;
  final List<int>? wanted;
  final List<dynamic>? webseeds;
  final int? webseedsSendingToUs;

  const Torrent({
    this.activityDate,
    this.addedDate,
    this.availability,
    this.bandwidthPriority,
    this.comment,
    this.corruptEver,
    this.creator,
    this.dateCreated,
    this.desiredAvailable,
    this.doneDate,
    this.downloadDir,
    this.downloadLimit,
    this.downloadLimited,
    this.downloadedEver,
    this.editDate,
    this.error,
    this.eta,
    this.etaIdle,
    this.fileCount,
    this.fileStats,
    this.files,
    this.group,
    this.haveUnchecked,
    this.haveValid,
    this.honorsSessionLimits,
    this.id,
    this.isFinished,
    this.isPrivate,
    this.isStalled,
    this.labels,
    this.leftUntilDone,
    this.magnetLink,
    this.manualAnnounceTime,
    this.maxConnectedPeers,
    this.metadataPercentComplete,
    this.name,
    this.peerLimit,
    this.peers,
    this.peersConnected,
    this.peersFrom,
    this.peersGettingFromUs,
    this.peersSendingToUs,
    this.percentComplete,
    this.percentDone,
    this.pieceCount,
    this.pieceSize,
    this.pieces,
    this.primaryMimeType,
    this.priorities,
    this.queuePosition,
    this.rateDownload,
    this.rateUpload,
    this.recheckProgress,
    this.secondsDownloading,
    this.secondsSeeding,
    this.seedIdleLimit,
    this.seedIdleMode,
    this.seedRatioLimit,
    this.seedRatioMode,
    this.sizeWhenDone,
    this.startDate,
    this.status,
    this.torrentFile,
    this.totalSize,
    this.trackerList,
    this.trackerStats,
    this.trackers,
    this.uploadLimit,
    this.uploadLimited,
    this.uploadRatio,
    this.uploadedEver,
    this.wanted,
    this.webseeds,
    this.webseedsSendingToUs,
  });

  factory Torrent.fromMap(Map<String, dynamic> data) => Torrent(
        activityDate: data['activityDate'] as int?,
        addedDate: data['addedDate'] as int?,
        availability: data['availability'] == null ? null : List<int>.from(data['availability']),
        bandwidthPriority: data['bandwidthPriority'] as int?,
        comment: data['comment'] as String?,
        corruptEver: data['corruptEver'] as int?,
        creator: data['creator'] as String?,
        dateCreated: data['dateCreated'] as int?,
        desiredAvailable: data['desiredAvailable'] as int?,
        doneDate: data['doneDate'] as int?,
        downloadDir: data['downloadDir'] as String?,
        downloadLimit: data['downloadLimit'] as int?,
        downloadLimited: data['downloadLimited'] as bool?,
        downloadedEver: data['downloadedEver'] as int?,
        editDate: data['editDate'] as int?,
        error: data['error'] as int?,
        eta: data['eta'] as int?,
        etaIdle: data['etaIdle'] as int?,
        fileCount: data['file-count'] as int?,
        fileStats: (data['fileStats'] as List<dynamic>?)
            ?.map((e) => FileStat.fromMap(e as Map<String, dynamic>))
            .toList(),
        files: (data['files'] as List<dynamic>?)
            ?.map((e) => File.fromMap(e as Map<String, dynamic>))
            .toList(),
        group: data['group'] as String?,
        haveUnchecked: data['haveUnchecked'] as int?,
        haveValid: data['haveValid'] as int?,
        honorsSessionLimits: data['honorsSessionLimits'] as bool?,
        id: data['id'] as int?,
        isFinished: data['isFinished'] as bool?,
        isPrivate: data['isPrivate'] as bool?,
        isStalled: data['isStalled'] as bool?,
        labels: data['labels'] as List<dynamic>?,
        leftUntilDone: data['leftUntilDone'] as int?,
        magnetLink: data['magnetLink'] as String?,
        manualAnnounceTime: data['manualAnnounceTime'] as int?,
        maxConnectedPeers: data['maxConnectedPeers'] as int?,
        metadataPercentComplete: data['metadataPercentComplete'] as int?,
        name: data['name'] as String?,
        peerLimit: data['peer-limit'] as int?,
        peers: (data['peers'] as List<dynamic>?)
            ?.map((e) => Peer.fromMap(e as Map<String, dynamic>))
            .toList(),
        peersConnected: data['peersConnected'] as int?,
        peersFrom: data['peersFrom'] == null
            ? null
            : PeersFrom.fromMap(data['peersFrom'] as Map<String, dynamic>),
        peersGettingFromUs: data['peersGettingFromUs'] as int?,
        peersSendingToUs: data['peersSendingToUs'] as int?,
        percentComplete: data['percentComplete'] as int?,
        percentDone: data['percentDone'] as int?,
        pieceCount: data['pieceCount'] as int?,
        pieceSize: data['pieceSize'] as int?,
        pieces: data['pieces'] as String?,
        primaryMimeType: data['primary-mime-type'] as String?,
        priorities: data['priorities'] == null ? null : List<int>.from(data['priorities']),
        queuePosition: data['queuePosition'] as int?,
        rateDownload: data['rateDownload'] as int?,
        rateUpload: data['rateUpload'] as int?,
        recheckProgress: data['recheckProgress'] as int?,
        secondsDownloading: data['secondsDownloading'] as int?,
        secondsSeeding: data['secondsSeeding'] as int?,
        seedIdleLimit: data['seedIdleLimit'] as int?,
        seedIdleMode: data['seedIdleMode'] as int?,
        seedRatioLimit: data['seedRatioLimit'] as int?,
        seedRatioMode: data['seedRatioMode'] as int?,
        sizeWhenDone: data['sizeWhenDone'] as int?,
        startDate: data['startDate'] as int?,
        status: data['status'] as int?,
        torrentFile: data['torrentFile'] as String?,
        totalSize: data['totalSize'] as int?,
        trackerList: data['trackerList'] as String?,
        trackerStats: (data['trackerStats'] as List<dynamic>?)
            ?.map((e) => TrackerStat.fromMap(e as Map<String, dynamic>))
            .toList(),
        trackers: (data['trackers'] as List<dynamic>?)
            ?.map((e) => Tracker.fromMap(e as Map<String, dynamic>))
            .toList(),
        uploadLimit: data['uploadLimit'] as int?,
        uploadLimited: data['uploadLimited'] as bool?,
        uploadRatio: (data['uploadRatio'] as num?)?.toDouble(),
        uploadedEver: data['uploadedEver'] as int?,
        wanted: data['wanted'] == null ? null : List<int>.from(data['wanted']),
        webseeds: data['webseeds'] as List<dynamic>?,
        webseedsSendingToUs: data['webseedsSendingToUs'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'activityDate': activityDate,
        'addedDate': addedDate,
        'availability': availability,
        'bandwidthPriority': bandwidthPriority,
        'comment': comment,
        'corruptEver': corruptEver,
        'creator': creator,
        'dateCreated': dateCreated,
        'desiredAvailable': desiredAvailable,
        'doneDate': doneDate,
        'downloadDir': downloadDir,
        'downloadLimit': downloadLimit,
        'downloadLimited': downloadLimited,
        'downloadedEver': downloadedEver,
        'editDate': editDate,
        'error': error,
        'eta': eta,
        'etaIdle': etaIdle,
        'file-count': fileCount,
        'fileStats': fileStats?.map((e) => e.toMap()).toList(),
        'files': files?.map((e) => e.toMap()).toList(),
        'group': group,
        'haveUnchecked': haveUnchecked,
        'haveValid': haveValid,
        'honorsSessionLimits': honorsSessionLimits,
        'id': id,
        'isFinished': isFinished,
        'isPrivate': isPrivate,
        'isStalled': isStalled,
        'labels': labels,
        'leftUntilDone': leftUntilDone,
        'magnetLink': magnetLink,
        'manualAnnounceTime': manualAnnounceTime,
        'maxConnectedPeers': maxConnectedPeers,
        'metadataPercentComplete': metadataPercentComplete,
        'name': name,
        'peer-limit': peerLimit,
        'peers': peers?.map((e) => e.toMap()).toList(),
        'peersConnected': peersConnected,
        'peersFrom': peersFrom?.toMap(),
        'peersGettingFromUs': peersGettingFromUs,
        'peersSendingToUs': peersSendingToUs,
        'percentComplete': percentComplete,
        'percentDone': percentDone,
        'pieceCount': pieceCount,
        'pieceSize': pieceSize,
        'pieces': pieces,
        'primary-mime-type': primaryMimeType,
        'priorities': priorities,
        'queuePosition': queuePosition,
        'rateDownload': rateDownload,
        'rateUpload': rateUpload,
        'recheckProgress': recheckProgress,
        'secondsDownloading': secondsDownloading,
        'secondsSeeding': secondsSeeding,
        'seedIdleLimit': seedIdleLimit,
        'seedIdleMode': seedIdleMode,
        'seedRatioLimit': seedRatioLimit,
        'seedRatioMode': seedRatioMode,
        'sizeWhenDone': sizeWhenDone,
        'startDate': startDate,
        'status': status,
        'torrentFile': torrentFile,
        'totalSize': totalSize,
        'trackerList': trackerList,
        'trackerStats': trackerStats?.map((e) => e.toMap()).toList(),
        'trackers': trackers?.map((e) => e.toMap()).toList(),
        'uploadLimit': uploadLimit,
        'uploadLimited': uploadLimited,
        'uploadRatio': uploadRatio,
        'uploadedEver': uploadedEver,
        'wanted': wanted,
        'webseeds': webseeds,
        'webseedsSendingToUs': webseedsSendingToUs,
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
      activityDate,
      addedDate,
      availability,
      bandwidthPriority,
      comment,
      corruptEver,
      creator,
      dateCreated,
      desiredAvailable,
      doneDate,
      downloadDir,
      downloadLimit,
      downloadLimited,
      downloadedEver,
      editDate,
      error,
      eta,
      etaIdle,
      fileCount,
      fileStats,
      files,
      group,
      haveUnchecked,
      haveValid,
      honorsSessionLimits,
      id,
      isFinished,
      isPrivate,
      isStalled,
      labels,
      leftUntilDone,
      magnetLink,
      manualAnnounceTime,
      maxConnectedPeers,
      metadataPercentComplete,
      name,
      peerLimit,
      peers,
      peersConnected,
      peersFrom,
      peersGettingFromUs,
      peersSendingToUs,
      percentComplete,
      percentDone,
      pieceCount,
      pieceSize,
      pieces,
      primaryMimeType,
      priorities,
      queuePosition,
      rateDownload,
      rateUpload,
      recheckProgress,
      secondsDownloading,
      secondsSeeding,
      seedIdleLimit,
      seedIdleMode,
      seedRatioLimit,
      seedRatioMode,
      sizeWhenDone,
      startDate,
      status,
      torrentFile,
      totalSize,
      trackerList,
      trackerStats,
      trackers,
      uploadLimit,
      uploadLimited,
      uploadRatio,
      uploadedEver,
      wanted,
      webseeds,
      webseedsSendingToUs,
    ];
  }
}
