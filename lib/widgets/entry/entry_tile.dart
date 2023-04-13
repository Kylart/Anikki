
import 'package:flutter/material.dart';

import 'package:anikki/widgets/entry/entry_tag.dart';
import 'package:anikki/widgets/glass_circle.dart';
import 'package:anikki/helpers/show_entry_context_menu.dart';
import 'package:anikki/widgets/anikki_icon.dart';
import 'package:anikki/widgets/entry/entry_action.dart';

class EntryTile<T> extends StatelessWidget {
  const EntryTile({
    super.key,
    required this.entry,
    required this.subtitle,
    required this.actions,
    this.title,
    this.bannerImage,
    this.coverImage,
    this.tags,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
  });

  final T entry;
  final Widget subtitle;
  final List<EntryAction> actions;
  final String? title;
  final String? bannerImage;
  final String? coverImage;
  final List<String>? tags;
  final String? episode;
  final bool showBookmark;
  final bool showDone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onSecondaryTapUp: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: actions,
          title: title ?? '',
          episode: episode,
        );
      },
      onLongPressStart: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: actions,
          title: title ?? '',
          episode: episode,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: bannerImage != null
              ? DecorationImage(
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: NetworkImage(bannerImage!),
                )
              : const DecorationImage(
                  alignment: Alignment.topCenter,
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/cover_placeholder.jpg'),
                ),
        ),
        child: ListTile(
          dense: true,
          isThreeLine: true,
          contentPadding: const EdgeInsets.all(4.0),
          title: Text(title ?? 'N/A'),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (coverImage != null)
                CircleAvatar(
                  backgroundImage: NetworkImage(coverImage!),
                ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: subtitle,
              ),
              Row(
                children: [
                  /// Tags
                  if (tags != null)
                    ...(tags!.length > 1 ? tags!.sublist(0, 2) : tags!).map(
                      (genre) {
                        return EntryTag(
                          child: Text(
                            genre.toString(),
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        );
                      },
                    ).toList(),

                  if (showBookmark)
                    EntryTag(
                      child: Icon(
                        Icons.bookmark_added_outlined,
                        size: 16.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  else if (showDone)
                    const EntryTag(
                      child: Icon(
                        Icons.done_all,
                        size: 16.0,
                        color: Colors.green,
                      ),
                    ),
                ],
              ),
            ],
          ),
          trailing: actions.isEmpty
              ? const SizedBox()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Tooltip(
                        message: actions.first.label,
                        child: GlassCircle(
                          child: SizedBox(
                            width: 35,
                            height: 35,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(4.0),
                                constraints: const BoxConstraints(),
                                onPressed: () =>
                                    actions.first.callback(context),
                                icon: AnikkiIcon(icon: actions.first.icon),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GlassCircle(
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            // padding: const EdgeInsets.all(4.0),
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            icon: GestureDetector(
                              onTapUp: (details) {
                                showEntryContextMenu(
                                  offset: details.globalPosition,
                                  context: context,
                                  actions: actions,
                                  title: title ?? '',
                                  episode: episode,
                                );
                              },
                              child: const AnikkiIcon(icon: Icons.more_horiz),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
