import 'package:flutter/material.dart';

import 'package:anikki/features/torrent/domain/models/torrent_type.dart';

class TorrentAppBar extends StatelessWidget {
  const TorrentAppBar({
    super.key,
    required this.type,
  });

  final TorrentType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 22.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            type.title(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
