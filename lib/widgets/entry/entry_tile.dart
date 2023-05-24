import 'package:anikki/widgets/anikki_icon.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/entry_card_overlay/helpers/show_overlay.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/entry/entry_tag.dart';

class EntryTile extends StatefulWidget {
  const EntryTile({
    super.key,
    required this.media,
    this.subtitle,
    this.libraryEntry,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
  });

  /// [Fragment$shortMedia] this entry card is about
  final Fragment$shortMedia media;

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
      onLongPress: () => showOverlay(
        context: context,
        media: widget.media,
        libraryEntry: widget.libraryEntry,
        key: key,
      ),
      onSecondaryTapUp: (details) => showOverlay(
        context: context,
        media: widget.media,
        libraryEntry: widget.libraryEntry,
        key: key,
      ),
      key: key,
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
              trailing: EntryTag(
                padding: EdgeInsets.zero,
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: IconButton(
                    onPressed: () => showOverlay(
                      context: context,
                      media: widget.media,
                      libraryEntry: widget.libraryEntry,
                      key: key,
                    ),
                    icon: const AnikkiIcon(icon: Icons.more_horiz),
                  ),
                ),
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
