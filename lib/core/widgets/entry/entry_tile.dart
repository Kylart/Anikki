import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/features/library/domain/models/library_entry.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_actions.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_trailer.dart';

class EntryTile extends StatefulWidget {
  const EntryTile({
    super.key,
    required this.media,
    required this.heroTag,
    this.subtitle,
    this.libraryEntry,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
  });

  /// [Media] this entry card is about
  final Media media;

  /// [LibraryEntry] for this card if any
  final LibraryEntry? libraryEntry;

  /// What should be display in the `subtitle` property
  final Widget? subtitle;

  /// What episode should this tile use as a reference
  /// when showing context menu
  final String? episode;

  /// [Hero] tag that should be used for this entry
  final String heroTag;

  /// Will add an icon if `true`. Defaults to `false`
  final bool showBookmark;

  /// Will add an icon if `true`. Defaults to `false`
  final bool showDone;

  @override
  State<EntryTile> createState() => _EntryTileState();
}

class _EntryTileState<T> extends State<EntryTile> {
  Media get media => widget.media;
  String get title =>
      media.title ?? widget.libraryEntry?.entries.first.title ?? 'N/A';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: media.anilistInfo.bannerImage != null
            ? DecorationImage(
                opacity: 0.25,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: NetworkImage(media.anilistInfo.bannerImage!),
              )
            : const DecorationImage(
                alignment: Alignment.topCenter,
                opacity: 0.25,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/cover_placeholder.jpg'),
              ),
      ),
      child: ExpansionTile(
        controlAffinity: ListTileControlAffinity.platform,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        title: AutoSizeText(
          title,
          maxLines: 2,
        ),
        leading: media.coverImage != null
            ? Hero(
                tag: widget.heroTag,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(media.coverImage!),
                ),
              )
            : null,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: widget.subtitle,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  /// Genres
                  if (media.anilistInfo.genres != null)
                    ...(media.anilistInfo.genres!.length > 1
                            ? media.anilistInfo.genres!.sublist(0, 2)
                            : media.anilistInfo.genres!)
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
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EntryCardOverlayActions(
                media: media,
                entry: widget.libraryEntry,
                reversed: true,
                showExpand: true,
              ),
              if (media.anilistInfo.trailer?.id != null &&
                  media.anilistInfo.trailer?.site == 'youtube' &&
                  media.anilistInfo.trailer?.thumbnail != null)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: EntryCardOverlayTrailer(media: media),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
