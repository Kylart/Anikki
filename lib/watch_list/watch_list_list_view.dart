import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/list_view_divider.dart';
import 'package:anikki/user_list/user_list_actions.dart';

class WatchListListView extends StatelessWidget {
  final List<AnilistListEntry> entries;

  const WatchListListView({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(4.0),
      itemCount: entries.length,
      separatorBuilder: (context, index) => const ListViewDivider(),
      itemBuilder: (context, index) {
        final entry = entries[index];

        return Container(
          decoration: BoxDecoration(
            image: entry.media.bannerImage != null
                ? DecorationImage(
                    opacity: 0.25,
                    fit: BoxFit.cover,
                    image: NetworkImage(entry.media.bannerImage!),
                  )
                : null,
          ),
          child: ListTile(
            isThreeLine: true,
            contentPadding: const EdgeInsets.all(8.0),
            title:
                Text(entry.media.title?.romaji ?? entry.media.title?.english),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  entry.media.coverImage?.extraLarge ??
                      entry.media.coverImage?.large ??
                      entry.media.coverImage?.medium ??
                      ''),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (entry.status == AnilistMediaListStatus.current &&
                    entry.progress != null)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                        'Currently at episode ${entry.progress!.toString()}'),
                  ),
                if (entry.status != AnilistMediaListStatus.current &&
                    entry.notes != null)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(entry.notes!),
                  ),
                if (entry.media.genres != null)
                  Row(
                    children: (entry.media.genres!.length > 1
                            ? entry.media.genres!.sublist(0, 2)
                            : entry.media.genres!)
                        .map(
                      (genre) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Chip(
                            label: Text(
                              genre.toString(),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () {
                      download<AnilistListEntry>(context, entry);
                    },
                    icon: const Icon(Icons.file_download),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
