import 'package:anikki/features/settings/models/qbittorrent_settings.dart';
import 'package:anikki/features/settings/models/settings.dart';
import 'package:anikki/features/settings/models/transmission_settings.dart';
import 'package:anikki/features/torrent/helpers/torrent_type.dart';
import 'package:flutter/material.dart';

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
