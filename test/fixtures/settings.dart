import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';

import 'path.dart';

const settings = Settings(
  localDirectory: path,
  newsLayout: NewsLayouts.list,
  userListLayouts: UserListLayouts.grid,
  theme: ThemeMode.system,
  torrentType: TorrentType.none,
  transmissionSettings: TransmissionSettings(),
  qBitTorrentSettings: QBitTorrentSettings(),
);
