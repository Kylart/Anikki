import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/glass_circle.dart';
import 'package:anikki/helpers/show_entry_context_menu.dart';
import 'package:anikki/library/library_actions.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/watch_list/watch_list_actions.dart';
import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:anikki/components/entry_action.dart';
import 'package:anikki/news/news_actions.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anilist/anilist.dart';

class EntryTile<T extends HasAnilistMedia> extends StatelessWidget {
  const EntryTile({
    super.key,
    required this.entry,
    required this.subtitle,
  });

  final T entry;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    String? episode;
    List<EntryAction> actions = [];

    if (T == ScheduleEntry) {
      actions = getNewsActions(
        context: context,
        entry: entry as ScheduleEntry,
        store: context.watch<AnilistStore>(),
      );

      episode = (entry as ScheduleEntry).episode?.toString();
    } else if (T == LocalFile) {
      actions = getLibraryActions(
        context,
        entry as LocalFile,
      );

      episode = (entry as LocalFile).episode?.toString();
    } else if (T == AnilistListEntry) {
      actions = getWatchListActions(
        context,
        entry as AnilistListEntry,
      );
    }

    return GestureDetector(
      onTap: () {},
      onSecondaryTapUp: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: actions,
          title: entry.media.title?.title() ?? '',
          episode: episode,
        );
      },
      onLongPressStart: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: actions,
          title: entry.media.title?.title() ?? '',
          episode: episode,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: entry.media.bannerImage != null
              ? DecorationImage(
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: NetworkImage(entry.media.bannerImage!),
                )
              : const DecorationImage(
                  alignment: Alignment.topCenter,
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/cover_placeholder.jpg'),
                ),
        ),
        child: ListTile(
          isThreeLine: true,
          contentPadding: const EdgeInsets.all(8.0),
          title: Text(entry.media.title?.romaji ?? entry.media.title?.english),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              entry.media.coverImage?.extraLarge ??
                  entry.media.coverImage?.large ??
                  entry.media.coverImage?.medium ??
                  '',
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: subtitle,
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
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 7.0,
                                  horizontal: 14.0,
                                ),
                                child: Text(genre.toString()),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
            ],
          ),
          trailing: actions.isEmpty
              ? const SizedBox()
              : SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Tooltip(
                          message: actions.first.label,
                          child: GlassCircle(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(6.0),
                                constraints: const BoxConstraints(),
                                onPressed: () =>
                                    actions.first.callback(context),
                                icon: AnikkiIcon(icon: actions.first.icon),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GlassCircle(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(6.0),
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            icon: GestureDetector(
                              onTapUp: (details) {
                                showEntryContextMenu(
                                  offset: details.globalPosition,
                                  context: context,
                                  actions: actions,
                                  title: entry.media.title?.title() ?? '',
                                  episode: episode,
                                );
                              },
                              child: const AnikkiIcon(icon: Icons.more_horiz),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
