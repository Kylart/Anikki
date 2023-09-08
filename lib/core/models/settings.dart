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
    required this.localDirectory,
    required this.userListLayouts,
    required this.theme,
    required this.torrentType,
    required this.transmissionSettings,
    required this.qBitTorrentSettings,
    required this.videoPlayerSettings,
  });

  final String localDirectory;
  final UserListLayouts userListLayouts;
  final ThemeMode theme;

  final TorrentType torrentType;
  final TransmissionSettings transmissionSettings;
  final QBitTorrentSettings qBitTorrentSettings;
  final VideoPlayerSettings videoPlayerSettings;

  Settings copyWith({
    String? localDirectory,
    UserListLayouts? userListLayouts,
    ThemeMode? theme,
    TorrentType? torrentType,
    TransmissionSettings? transmissionSettings,
    QBitTorrentSettings? qBitTorrentSettings,
    VideoPlayerSettings? videoPlayerSettings,
  }) {
    return Settings(
      localDirectory: localDirectory ?? this.localDirectory,
      userListLayouts: userListLayouts ?? this.userListLayouts,
      theme: theme ?? this.theme,
      torrentType: torrentType ?? this.torrentType,
      transmissionSettings: transmissionSettings ?? this.transmissionSettings,
      qBitTorrentSettings: qBitTorrentSettings ?? this.qBitTorrentSettings,
      videoPlayerSettings: videoPlayerSettings ?? this.videoPlayerSettings,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      localDirectory,
      userListLayouts,
      theme,
      torrentType,
      transmissionSettings,
      qBitTorrentSettings,
      videoPlayerSettings,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localDirectory': localDirectory,
      'userListLayouts': userListLayouts.name,
      'theme': theme.name,
      'torrentType': torrentType.name,
      'transmissionSettings': transmissionSettings.toMap(),
      'qBitTorrentSettings': qBitTorrentSettings.toMap(),
      'videoPlayerSettings': videoPlayerSettings.toMap(),
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      localDirectory: map['localDirectory'] as String,
      userListLayouts: UserListLayouts.values
          .where((e) => e.name == map['userListLayouts'])
          .first,
      theme: ThemeMode.values.where((e) => e.name == map['theme']).first,
      torrentType:
          TorrentType.values.where((e) => e.name == map['torrentType']).first,
      transmissionSettings: TransmissionSettings.fromMap(
          map['transmissionSettings'] as Map<String, dynamic>),
      qBitTorrentSettings: QBitTorrentSettings.fromMap(
          map['qBitTorrentSettings'] as Map<String, dynamic>),
      videoPlayerSettings: VideoPlayerSettings.fromMap(
          map['videoPlayerSettings'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source) as Map<String, dynamic>);
}
