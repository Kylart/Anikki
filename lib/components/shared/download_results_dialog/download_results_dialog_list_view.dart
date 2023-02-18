import 'package:flutter/material.dart';
import 'package:kawanime/providers/nyaa/types/torrent.dart';
import 'package:open_app_file/open_app_file.dart';

class DownloadResultsDialogListView extends StatelessWidget {
  const DownloadResultsDialogListView({super.key, required this.entries});

  final List<Torrent> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final entry = entries[index];

        return ListTile(
          onTap: () async {
            await OpenAppFile.open(entry.magnet);
          },
          leading: CircleAvatar(
            radius: 8.0,
            backgroundColor: entry.status == 'success'
                ? Colors.green
                : entry.status == 'danger'
                    ? Colors.red
                    : Colors.yellow,
          ),
          title: Text(entry.name),
          subtitle: Text(entry.filesize),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                            child: Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        )),
                        TextSpan(
                            text: entry.seeders,
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
                          text: entry.leechers,
                          style: const TextStyle(color: Colors.redAccent))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: entries.length,
    );
  }
}
