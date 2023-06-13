import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/qbittorrent/domain/domain.dart';
import 'package:anikki/features/qbittorrent/presentation/bloc/qbittorrent_bloc.dart';

class QBitTorrentTorrentTile extends StatelessWidget {
  const QBitTorrentTorrentTile({
    super.key,
    required this.torrent,
  });

  final Torrent torrent;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<QBitTorrentBloc>(context);
    final progress = torrent.progress;
    final status = getStatus(torrent.state);

    return ListTile(
      dense: true,
      title: Text(torrent.name ?? 'N/A'),
      subtitle: Text(status),
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress,
              color: (progress ?? 0) == 1.0 ? Colors.green : null,
            ),
            if (progress != null)
              Center(
                child: Text(
                  '${(progress * 100).floor()}%',
                  style: const TextStyle(fontSize: 8.0),
                ),
              ),
          ],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (status == 'Paused')
            IconButton.outlined(
              constraints: const BoxConstraints(),
              iconSize: 20.0,
              onPressed: () {
                bloc.add(
                  QBitTorrentStartTorrent(torrent.hash),
                );
              },
              icon: const Icon(Icons.restart_alt),
            )
          else
            IconButton.outlined(
              constraints: const BoxConstraints(),
              iconSize: 20.0,
              onPressed: () {
                bloc.add(
                  QBitTorrentPauseTorrent(torrent.hash),
                );
              },
              icon: const Icon(Icons.pause),
            ),
          const SizedBox(
            width: 4.0,
          ),
          IconButton.outlined(
            constraints: const BoxConstraints(),
            iconSize: 20.0,
            onPressed: () {
              bloc.add(
                QBitTorrentRemoveTorrent(
                  torrent.hash,
                  progress != 1.0,
                ),
              );
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
