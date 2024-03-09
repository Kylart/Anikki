import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';

enum NewsLayouts {
  grid,
  list,
}

enum UserListLayouts {
  grid,
  list,
}

class Settings extends Equatable {
  const Settings({
    this.isFirstLaunch = true,
    this.userListLayouts = UserListLayouts.grid,
    this.theme = ThemeMode.system,
    this.torrentType = TorrentType.none,
    this.librarySettings = const LibrarySettings(),
    this.transmissionSettings = const TransmissionSettings(),
    this.qBitTorrentSettings = const QBitTorrentSettings(),
    this.videoPlayerSettings = const VideoPlayerSettings(),
    this.streamSettings = const StreamSettings(),
  });

  final bool isFirstLaunch;

  final UserListLayouts userListLayouts;
  final ThemeMode theme;

  final TorrentType torrentType;
  final LibrarySettings librarySettings;
  final TransmissionSettings transmissionSettings;
  final QBitTorrentSettings qBitTorrentSettings;
  final VideoPlayerSettings videoPlayerSettings;

  final StreamSettings streamSettings;

  Settings copyWith({
    bool? isFirstLaunch,
    UserListLayouts? userListLayouts,
    ThemeMode? theme,
    TorrentType? torrentType,
    LibrarySettings? librarySettings,
    TransmissionSettings? transmissionSettings,
    QBitTorrentSettings? qBitTorrentSettings,
    VideoPlayerSettings? videoPlayerSettings,
    StreamSettings? streamSettings,
  }) {
    return Settings(
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      userListLayouts: userListLayouts ?? this.userListLayouts,
      theme: theme ?? this.theme,
      torrentType: torrentType ?? this.torrentType,
      librarySettings: librarySettings ?? this.librarySettings,
      transmissionSettings: transmissionSettings ?? this.transmissionSettings,
      qBitTorrentSettings: qBitTorrentSettings ?? this.qBitTorrentSettings,
      videoPlayerSettings: videoPlayerSettings ?? this.videoPlayerSettings,
      streamSettings: streamSettings ?? this.streamSettings,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      isFirstLaunch,
      userListLayouts,
      theme,
      torrentType,
      librarySettings,
      transmissionSettings,
      qBitTorrentSettings,
      videoPlayerSettings,
      streamSettings,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isFirstLaunch': isFirstLaunch,
      'userListLayouts': userListLayouts.name,
      'theme': theme.name,
      'torrentType': torrentType.name,
      'librarySettings': librarySettings.toMap(),
      'transmissionSettings': transmissionSettings.toMap(),
      'qBitTorrentSettings': qBitTorrentSettings.toMap(),
      'videoPlayerSettings': videoPlayerSettings.toMap(),
      'streamSettings': streamSettings.toMap(),
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      userListLayouts: UserListLayouts.values
          .where((e) => e.name == map['userListLayouts'])
          .first,
      theme: ThemeMode.values.where((e) => e.name == map['theme']).first,
      torrentType:
          TorrentType.values.where((e) => e.name == map['torrentType']).first,
      librarySettings: LibrarySettings.fromMap(
          map['librarySettings'] as Map<String, dynamic>),
      transmissionSettings: TransmissionSettings.fromMap(
          map['transmissionSettings'] as Map<String, dynamic>),
      qBitTorrentSettings: QBitTorrentSettings.fromMap(
          map['qBitTorrentSettings'] as Map<String, dynamic>),
      videoPlayerSettings: VideoPlayerSettings.fromMap(
          map['videoPlayerSettings'] as Map<String, dynamic>),
      streamSettings:
          StreamSettings.fromMap(map['streamSettings'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source) as Map<String, dynamic>);
}
