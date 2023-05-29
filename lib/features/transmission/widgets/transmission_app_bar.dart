import 'package:flutter/material.dart';

import 'package:anikki/features/torrent/helpers/torrent_type.dart';

class TransmissionAppBar extends StatelessWidget {
  const TransmissionAppBar({super.key});

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
            TorrentType.transmission.title(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
