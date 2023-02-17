import 'package:flutter/material.dart';

import 'package:kawanime/components/user_list/user_list_actions.dart';
import 'package:kawanime/providers/local/types/file.dart';

class UserListLibraryListView extends StatelessWidget {
  final List<LocalFile> entries;

  const UserListLibraryListView({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(4.0),
      itemCount: entries.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final entry = entries[index];
        final coverImage = entry.media?.coverImage?.extraLarge ??
            entry.media?.coverImage?.large ??
            entry.media?.coverImage?.medium;

        return Container(
          decoration: BoxDecoration(
            image: entry.media?.bannerImage != null
                ? DecorationImage(
                    opacity: 0.25,
                    fit: BoxFit.cover,
                    image: NetworkImage(entry.media?.bannerImage!),
                  )
                : const DecorationImage(
                    alignment: Alignment.topCenter,
                    opacity: 0.25,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/cover_placeholder.jpg'),
                  ),
          ),
          child: ListTile(
            isThreeLine: entry.episode != null,
            contentPadding: const EdgeInsets.all(8.0),
            title: Text(entry.media?.title?.romaji ??
                entry.media?.title?.english ??
                entry.title),
            leading: coverImage != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(coverImage),
                  )
                : const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/placeholder.png'),
                  ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (entry.episode != null)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Episode ${entry.episode}'),
                  ),
                if (entry.media?.genres != null)
                  Row(
                    children: (entry.media!.genres!.length > 1
                            ? entry.media!.genres!.sublist(0, 2)
                            : entry.media!.genres!)
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
                    onPressed: () async => await deleteFile(entry, context),
                    icon: const Icon(Icons.play_arrow),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () async => await deleteFile(entry, context),
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
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
