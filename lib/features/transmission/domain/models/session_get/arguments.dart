import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'units.dart';

class Arguments extends Equatable {
  final int? altSpeedDown;
  final bool? altSpeedEnabled;
  final int? altSpeedTimeBegin;
  final int? altSpeedTimeDay;
  final bool? altSpeedTimeEnabled;
  final int? altSpeedTimeEnd;
  final int? altSpeedUp;
  final bool? antiBruteForceEnabled;
  final int? antiBruteForceThreshold;
  final bool? blocklistEnabled;
  final int? blocklistSize;
  final String? blocklistUrl;
  final int? cacheSizeMb;
  final String? configDir;
  final String? defaultTrackers;
  final bool? dhtEnabled;
  final String? downloadDir;
  final int? downloadDirFreeSpace;
  final bool? downloadQueueEnabled;
  final int? downloadQueueSize;
  final String? encryption;
  final int? idleSeedingLimit;
  final bool? idleSeedingLimitEnabled;
  final String? incompleteDir;
  final bool? incompleteDirEnabled;
  final bool? lpdEnabled;
  final int? peerLimitGlobal;
  final int? peerLimitPerTorrent;
  final int? peerPort;
  final bool? peerPortRandomOnStart;
  final bool? pexEnabled;
  final bool? portForwardingEnabled;
  final bool? queueStalledEnabled;
  final int? queueStalledMinutes;
  final bool? renamePartialFiles;
  final int? rpcVersion;
  final int? rpcVersionMinimum;
  final String? rpcVersionSemver;
  final bool? scriptTorrentAddedEnabled;
  final String? scriptTorrentAddedFilename;
  final bool? scriptTorrentDoneEnabled;
  final String? scriptTorrentDoneFilename;
  final bool? scriptTorrentDoneSeedingEnabled;
  final String? scriptTorrentDoneSeedingFilename;
  final bool? seedQueueEnabled;
  final int? seedQueueSize;
  final int? seedRatioLimit;
  final bool? seedRatioLimited;
  final String? sessionId;
  final int? speedLimitDown;
  final bool? speedLimitDownEnabled;
  final int? speedLimitUp;
  final bool? speedLimitUpEnabled;
  final bool? startAddedTorrents;
  final bool? tcpEnabled;
  final bool? trashOriginalTorrentFiles;
  final Units? units;
  final bool? utpEnabled;
  final String? version;

  const Arguments({
    this.altSpeedDown,
    this.altSpeedEnabled,
    this.altSpeedTimeBegin,
    this.altSpeedTimeDay,
    this.altSpeedTimeEnabled,
    this.altSpeedTimeEnd,
    this.altSpeedUp,
    this.antiBruteForceEnabled,
    this.antiBruteForceThreshold,
    this.blocklistEnabled,
    this.blocklistSize,
    this.blocklistUrl,
    this.cacheSizeMb,
    this.configDir,
    this.defaultTrackers,
    this.dhtEnabled,
    this.downloadDir,
    this.downloadDirFreeSpace,
    this.downloadQueueEnabled,
    this.downloadQueueSize,
    this.encryption,
    this.idleSeedingLimit,
    this.idleSeedingLimitEnabled,
    this.incompleteDir,
    this.incompleteDirEnabled,
    this.lpdEnabled,
    this.peerLimitGlobal,
    this.peerLimitPerTorrent,
    this.peerPort,
    this.peerPortRandomOnStart,
    this.pexEnabled,
    this.portForwardingEnabled,
    this.queueStalledEnabled,
    this.queueStalledMinutes,
    this.renamePartialFiles,
    this.rpcVersion,
    this.rpcVersionMinimum,
    this.rpcVersionSemver,
    this.scriptTorrentAddedEnabled,
    this.scriptTorrentAddedFilename,
    this.scriptTorrentDoneEnabled,
    this.scriptTorrentDoneFilename,
    this.scriptTorrentDoneSeedingEnabled,
    this.scriptTorrentDoneSeedingFilename,
    this.seedQueueEnabled,
    this.seedQueueSize,
    this.seedRatioLimit,
    this.seedRatioLimited,
    this.sessionId,
    this.speedLimitDown,
    this.speedLimitDownEnabled,
    this.speedLimitUp,
    this.speedLimitUpEnabled,
    this.startAddedTorrents,
    this.tcpEnabled,
    this.trashOriginalTorrentFiles,
    this.units,
    this.utpEnabled,
    this.version,
  });

  factory Arguments.fromMap(Map<String, dynamic> data) => Arguments(
        altSpeedDown: data['alt-speed-down'] as int?,
        altSpeedEnabled: data['alt-speed-enabled'] as bool?,
        altSpeedTimeBegin: data['alt-speed-time-begin'] as int?,
        altSpeedTimeDay: data['alt-speed-time-day'] as int?,
        altSpeedTimeEnabled: data['alt-speed-time-enabled'] as bool?,
        altSpeedTimeEnd: data['alt-speed-time-end'] as int?,
        altSpeedUp: data['alt-speed-up'] as int?,
        antiBruteForceEnabled: data['anti-brute-force-enabled'] as bool?,
        antiBruteForceThreshold: data['anti-brute-force-threshold'] as int?,
        blocklistEnabled: data['blocklist-enabled'] as bool?,
        blocklistSize: data['blocklist-size'] as int?,
        blocklistUrl: data['blocklist-url'] as String?,
        cacheSizeMb: data['cache-size-mb'] as int?,
        configDir: data['config-dir'] as String?,
        defaultTrackers: data['default-trackers'] as String?,
        dhtEnabled: data['dht-enabled'] as bool?,
        downloadDir: data['download-dir'] as String?,
        downloadDirFreeSpace: data['download-dir-free-space'] as int?,
        downloadQueueEnabled: data['download-queue-enabled'] as bool?,
        downloadQueueSize: data['download-queue-size'] as int?,
        encryption: data['encryption'] as String?,
        idleSeedingLimit: data['idle-seeding-limit'] as int?,
        idleSeedingLimitEnabled: data['idle-seeding-limit-enabled'] as bool?,
        incompleteDir: data['incomplete-dir'] as String?,
        incompleteDirEnabled: data['incomplete-dir-enabled'] as bool?,
        lpdEnabled: data['lpd-enabled'] as bool?,
        peerLimitGlobal: data['peer-limit-global'] as int?,
        peerLimitPerTorrent: data['peer-limit-per-torrent'] as int?,
        peerPort: data['peer-port'] as int?,
        peerPortRandomOnStart: data['peer-port-random-on-start'] as bool?,
        pexEnabled: data['pex-enabled'] as bool?,
        portForwardingEnabled: data['port-forwarding-enabled'] as bool?,
        queueStalledEnabled: data['queue-stalled-enabled'] as bool?,
        queueStalledMinutes: data['queue-stalled-minutes'] as int?,
        renamePartialFiles: data['rename-partial-files'] as bool?,
        rpcVersion: data['rpc-version'] as int?,
        rpcVersionMinimum: data['rpc-version-minimum'] as int?,
        rpcVersionSemver: data['rpc-version-semver'] as String?,
        scriptTorrentAddedEnabled:
            data['script-torrent-added-enabled'] as bool?,
        scriptTorrentAddedFilename:
            data['script-torrent-added-filename'] as String?,
        scriptTorrentDoneEnabled: data['script-torrent-done-enabled'] as bool?,
        scriptTorrentDoneFilename:
            data['script-torrent-done-filename'] as String?,
        scriptTorrentDoneSeedingEnabled:
            data['script-torrent-done-seeding-enabled'] as bool?,
        scriptTorrentDoneSeedingFilename:
            data['script-torrent-done-seeding-filename'] as String?,
        seedQueueEnabled: data['seed-queue-enabled'] as bool?,
        seedQueueSize: data['seed-queue-size'] as int?,
        seedRatioLimit: data['seedRatioLimit'] as int?,
        seedRatioLimited: data['seedRatioLimited'] as bool?,
        sessionId: data['session-id'] as String?,
        speedLimitDown: data['speed-limit-down'] as int?,
        speedLimitDownEnabled: data['speed-limit-down-enabled'] as bool?,
        speedLimitUp: data['speed-limit-up'] as int?,
        speedLimitUpEnabled: data['speed-limit-up-enabled'] as bool?,
        startAddedTorrents: data['start-added-torrents'] as bool?,
        tcpEnabled: data['tcp-enabled'] as bool?,
        trashOriginalTorrentFiles:
            data['trash-original-torrent-files'] as bool?,
        units: data['units'] == null
            ? null
            : Units.fromMap(data['units'] as Map<String, dynamic>),
        utpEnabled: data['utp-enabled'] as bool?,
        version: data['version'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'alt-speed-down': altSpeedDown,
        'alt-speed-enabled': altSpeedEnabled,
        'alt-speed-time-begin': altSpeedTimeBegin,
        'alt-speed-time-day': altSpeedTimeDay,
        'alt-speed-time-enabled': altSpeedTimeEnabled,
        'alt-speed-time-end': altSpeedTimeEnd,
        'alt-speed-up': altSpeedUp,
        'anti-brute-force-enabled': antiBruteForceEnabled,
        'anti-brute-force-threshold': antiBruteForceThreshold,
        'blocklist-enabled': blocklistEnabled,
        'blocklist-size': blocklistSize,
        'blocklist-url': blocklistUrl,
        'cache-size-mb': cacheSizeMb,
        'config-dir': configDir,
        'default-trackers': defaultTrackers,
        'dht-enabled': dhtEnabled,
        'download-dir': downloadDir,
        'download-dir-free-space': downloadDirFreeSpace,
        'download-queue-enabled': downloadQueueEnabled,
        'download-queue-size': downloadQueueSize,
        'encryption': encryption,
        'idle-seeding-limit': idleSeedingLimit,
        'idle-seeding-limit-enabled': idleSeedingLimitEnabled,
        'incomplete-dir': incompleteDir,
        'incomplete-dir-enabled': incompleteDirEnabled,
        'lpd-enabled': lpdEnabled,
        'peer-limit-global': peerLimitGlobal,
        'peer-limit-per-torrent': peerLimitPerTorrent,
        'peer-port': peerPort,
        'peer-port-random-on-start': peerPortRandomOnStart,
        'pex-enabled': pexEnabled,
        'port-forwarding-enabled': portForwardingEnabled,
        'queue-stalled-enabled': queueStalledEnabled,
        'queue-stalled-minutes': queueStalledMinutes,
        'rename-partial-files': renamePartialFiles,
        'rpc-version': rpcVersion,
        'rpc-version-minimum': rpcVersionMinimum,
        'rpc-version-semver': rpcVersionSemver,
        'script-torrent-added-enabled': scriptTorrentAddedEnabled,
        'script-torrent-added-filename': scriptTorrentAddedFilename,
        'script-torrent-done-enabled': scriptTorrentDoneEnabled,
        'script-torrent-done-filename': scriptTorrentDoneFilename,
        'script-torrent-done-seeding-enabled': scriptTorrentDoneSeedingEnabled,
        'script-torrent-done-seeding-filename':
            scriptTorrentDoneSeedingFilename,
        'seed-queue-enabled': seedQueueEnabled,
        'seed-queue-size': seedQueueSize,
        'seedRatioLimit': seedRatioLimit,
        'seedRatioLimited': seedRatioLimited,
        'session-id': sessionId,
        'speed-limit-down': speedLimitDown,
        'speed-limit-down-enabled': speedLimitDownEnabled,
        'speed-limit-up': speedLimitUp,
        'speed-limit-up-enabled': speedLimitUpEnabled,
        'start-added-torrents': startAddedTorrents,
        'tcp-enabled': tcpEnabled,
        'trash-original-torrent-files': trashOriginalTorrentFiles,
        'units': units?.toMap(),
        'utp-enabled': utpEnabled,
        'version': version,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Arguments].
  factory Arguments.fromJson(String data) {
    return Arguments.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Arguments] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      altSpeedDown,
      altSpeedEnabled,
      altSpeedTimeBegin,
      altSpeedTimeDay,
      altSpeedTimeEnabled,
      altSpeedTimeEnd,
      altSpeedUp,
      antiBruteForceEnabled,
      antiBruteForceThreshold,
      blocklistEnabled,
      blocklistSize,
      blocklistUrl,
      cacheSizeMb,
      configDir,
      defaultTrackers,
      dhtEnabled,
      downloadDir,
      downloadDirFreeSpace,
      downloadQueueEnabled,
      downloadQueueSize,
      encryption,
      idleSeedingLimit,
      idleSeedingLimitEnabled,
      incompleteDir,
      incompleteDirEnabled,
      lpdEnabled,
      peerLimitGlobal,
      peerLimitPerTorrent,
      peerPort,
      peerPortRandomOnStart,
      pexEnabled,
      portForwardingEnabled,
      queueStalledEnabled,
      queueStalledMinutes,
      renamePartialFiles,
      rpcVersion,
      rpcVersionMinimum,
      rpcVersionSemver,
      scriptTorrentAddedEnabled,
      scriptTorrentAddedFilename,
      scriptTorrentDoneEnabled,
      scriptTorrentDoneFilename,
      scriptTorrentDoneSeedingEnabled,
      scriptTorrentDoneSeedingFilename,
      seedQueueEnabled,
      seedQueueSize,
      seedRatioLimit,
      seedRatioLimited,
      sessionId,
      speedLimitDown,
      speedLimitDownEnabled,
      speedLimitUp,
      speedLimitUpEnabled,
      startAddedTorrents,
      tcpEnabled,
      trashOriginalTorrentFiles,
      units,
      utpEnabled,
      version,
    ];
  }
}
