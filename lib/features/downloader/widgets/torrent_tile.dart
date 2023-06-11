import 'package:flutter/material.dart';
import 'package:nyaa/nyaa.dart';
import 'package:open_app_file/open_app_file.dart';

import 'package:anikki/core/helpers/desktop_hooks.dart';
import 'package:anikki/core/helpers/open_in_browser.dart';

class TorrentTile extends StatelessWidget {
  const TorrentTile({
    super.key,
    required this.torrent,
  });

  final Torrent torrent;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () async {
        if (isDesktop()) {
          await OpenAppFile.open(torrent.magnet);
        } else {
          openInBrowser(torrent.magnet);
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
