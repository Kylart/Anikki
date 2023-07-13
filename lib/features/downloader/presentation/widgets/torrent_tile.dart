import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:open_app_file/open_app_file.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/downloader/presentation/bloc/downloader_bloc.dart';
import 'package:anikki/features/downloader/presentation/widgets/stream_placeholder.dart';
import 'package:anikki/features/torrent/domain/models/models.dart';
import 'package:anikki/features/torrent/presentation/bloc/torrent_bloc.dart';

class TorrentTile extends StatelessWidget {
  const TorrentTile({
    super.key,
    required this.torrent,
  });

  final NyaaTorrent torrent;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () async {
        final state = BlocProvider.of<DownloaderBloc>(context).state;

        final isStreaming =
            state is DownloaderSuccess ? state.isStreaming : false;

        void showError() {
          showDialog(
              context: context,
              builder: (context) {
                return PlatformAlertDialog(
                  title: const Text('Torrent client not connected'),
                  content: const Text(
                      'Please start your torrent client to enable streaming.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Ok'),
                    ),
                  ],
                );
              });
        }

        if (isStreaming) {
          final bloc = BlocProvider.of<TorrentBloc>(context);

          if (bloc.state is TorrentCannotLoad) return showError();

          bloc.add(
            TorrentAddTorrent(
              magnet: torrent.magnet,
              stream: true,
              callback: (Torrent torrent) {
                Navigator.of(context).pop();
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      child: StreamPlaceholder(
                        magnet: torrent.magnet,
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else {
          if (isDesktop()) {
            await OpenAppFile.open(torrent.magnet);
          } else {
            openInBrowser(torrent.magnet);
          }
        }
      },
      leading: CircleAvatar(
        radius: 8.0,
        backgroundColor: torrent.status == 'success'
            ? Colors.green
            : torrent.status == 'danger'
                ? Colors.red
                : Colors.yellow,
      ),
      title: Text(torrent.name),
      subtitle: Text(torrent.filesize),
      trailing: SizedBox(
        width: 120,
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                    )),
                    TextSpan(
                        text: torrent.seeders,
                        style: const TextStyle(color: Colors.green))
                  ],
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.arrow_downward,
                    color: Colors.redAccent,
                  )),
                  TextSpan(
                      text: torrent.leechers,
                      style: const TextStyle(color: Colors.redAccent))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
