import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/entry_card_overlay/helpers/show_overlay.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/anikki_action_button.dart';
import 'package:anikki/models/anikki_action.dart';
import 'package:anikki/widgets/entry/entry_tag.dart';
import 'package:anikki/helpers/show_entry_context_menu.dart';
import 'package:anikki/widgets/anikki_icon.dart';

class EntryTile extends StatefulWidget {
  const EntryTile({
    super.key,
    required this.media,
    required this.actions,
    this.subtitle,
    this.libraryEntry,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
  });

  /// [Fragment$shortMedia] this entry card is about
  final Fragment$shortMedia media;

  /// [AnikkiAction] list to show onSecondaryTap, onLongPress or with
  /// [AnikkiActionButton]
  final List<AnikkiAction> actions;

  /// [LibraryEntry] for this card if any
  final LibraryEntry? libraryEntry;

  /// What should be display in the `subtitle` property
  final Widget? subtitle;

  /// What episode should this tile use as a reference
  /// when showing context menu
  final String? episode;

  /// Will add an icon if `true`. Defaults to `false`
  final bool showBookmark;

  /// Will add an icon if `true`. Defaults to `false`
  final bool showDone;

  @override
  State<EntryTile> createState() => _EntryTileState();
}

class _EntryTileState<T> extends State<EntryTile> {
  GlobalKey key = GlobalKey();

  String get title =>
      widget.media.title?.userPreferred ??
      widget.libraryEntry?.entries.first.title ??
      'N/A';

  String? get coverImage =>
      widget.media.coverImage?.extraLarge ??
      widget.media.coverImage?.large ??
      widget.media.coverImage?.medium;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showOverlay(
        context: context,
        media: widget.media,
        libraryEntry: widget.libraryEntry,
        key: key,
      ),
      key: key,
      onSecondaryTapUp: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: widget.actions,
          title: title,
          episode: widget.episode,
        );
      },
      onLongPressStart: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: widget.actions,
          title: title,
          episode: widget.episode,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: widget.media.bannerImage != null
              ? DecorationImage(
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.media.bannerImage!),
                )
              : const DecorationImage(
                  alignment: Alignment.topCenter,
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/cover_placeholder.jpg'),
                ),
        ),
        child: Column(
          children: [
            ListTile(
              dense: true,
              isThreeLine: false,
              title: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              leading: coverImage != null
                  ? Hero(
                      tag: coverImage!,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(coverImage!),
                      ),
                    )
                  : null,
              subtitle: Padding(
                padding: const EdgeInsets.all(4.0),
                child: widget.subtitle,
              ),
              trailing: widget.actions.isEmpty
                  ? const SizedBox()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Tooltip(
                          message: widget.actions.first.label,
                          child: EntryTag(
                            padding: EdgeInsets.zero,
                            child: SizedBox(
                              height: 35,
                              width: 35,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () =>
                                    widget.actions.first.callback(context),
                                icon:
                                    AnikkiIcon(icon: widget.actions.first.icon),
                                // icon: AnikkiIcon(icon: actions.first.icon),
                              ),
                            ),
                          ),
                        ),
                        EntryTag(
                          padding: EdgeInsets.zero,
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: AnikkiActionButton(
                              icon: const AnikkiIcon(icon: Icons.more_horiz),
                              actions: widget.actions,
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 72.0, bottom: 4.0),
              child: Row(
                children: [
                  /// Genres
                  if (widget.media.genres != null)
                    ...(widget.media.genres!.length > 1
                            ? widget.media.genres!.sublist(0, 2)
                            : widget.media.genres!)
                        .map(
                      (genre) {
                        return EntryTag(
                          child: Text(
                            genre.toString(),
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        );
                      },
                    ).toList(),

                  if (widget.showBookmark)
                    EntryTag(
                      child: Icon(
                        Icons.bookmark_added_outlined,
                        size: 16.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  else if (widget.showDone)
                    const EntryTag(
                      child: Icon(
                        Icons.done_all,
                        size: 16.0,
                        color: Colors.green,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
