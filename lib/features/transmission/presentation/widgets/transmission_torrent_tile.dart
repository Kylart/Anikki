import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/transmission/domain/domain.dart';
import 'package:anikki/features/transmission/presentation/bloc/transmission_bloc.dart';

class TransmissionTorrentTile extends StatelessWidget {
  const TransmissionTorrentTile({
    super.key,
    required this.torrent,
  });

  final Torrent torrent;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TransmissionBloc>(context);
    final progress = torrent.percentDone?.toDouble();

    return ListTile(
      dense: true,
      title: Text(torrent.name ?? 'N/A'),
      subtitle: Text(getStatus(torrent.status ?? 7)),
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
          if (torrent.status == 0)
            IconButton.outlined(
              constraints: const BoxConstraints(),
              iconSize: 20.0,
              onPressed: () {
                bloc.add(
                  TransmissionStartTorrent(torrent.id ?? 0),
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
                  TransmissionPauseTorrent(torrent.id ?? 0),
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
                TransmissionRemoveTorrent(
                  torrent.id ?? 0,
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
