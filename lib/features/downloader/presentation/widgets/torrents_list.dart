import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/downloader/presentation/widgets/torrent_tile.dart';

class TorrentsList extends StatelessWidget {
  const TorrentsList({
    super.key,
    required this.torrents,
  });

  final List<NyaaTorrent> torrents;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return TorrentTile(
          torrent: torrents.elementAt(index),
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemCount: torrents.length,
    );
  }
}
