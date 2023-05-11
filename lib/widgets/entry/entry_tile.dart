import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';
import 'package:anikki/widgets/anikki_action_button.dart';
import 'package:anikki/models/anikki_action.dart';
import 'package:anikki/widgets/entry/entry_tag.dart';
import 'package:anikki/helpers/show_entry_context_menu.dart';
import 'package:anikki/widgets/anikki_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryTile<T> extends StatefulWidget {
  const EntryTile({
    super.key,
    required this.entry,
    required this.subtitle,
    required this.actions,
    required this.overlayWidget,
    this.title,
    this.bannerImage,
    this.coverImage,
    this.tags,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
  });

  /// Entry for thie [EntryTile], for now, should be either
  /// [Fragment$shortMedia], [Query$GetLists$MediaListCollection$lists$entries]
  /// or [LocalFile].
  final T entry;

  /// [AnikkiAction] list to show onSecondaryTap, onLongPress or with
  /// [AnikkiActionButton]
  final List<AnikkiAction> actions;

  /// What should be display in the `title` property
  final String? title;

  /// What should be display in the `subtitle` property
  final Widget subtitle;

  /// BannerImage URL to show as background of the tile.
  /// Will be replaced by placeholder asset `assets/images/cover_placeholder.jpg`
  /// if `null`
  final String? bannerImage;

  /// CoverImage URL to show as leading [CircleAvatar] if any.
  final String? coverImage;

  /// Tags to be displayed for this entry
  final List<String>? tags;

  /// Episode to show more context on Context Menu
  final String? episode;

  /// Will add an icon if `true`. Defaults to `false`
  final bool showBookmark;

  /// Will add an icon if `true`. Defaults to `false`
  final bool showDone;

  /// Overlay Widget to show onTap
  final Widget overlayWidget;

  @override
  State<EntryTile<T>> createState() => _EntryTileState<T>();
}

class _EntryTileState<T> extends State<EntryTile<T>> {
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<EntryCardOverlayBloc>(context).add(
        EntryCardOverlayRequested(
          key: key,
          context: context,
          child: widget.overlayWidget,
        ),
      ),
      key: key,
      onSecondaryTapUp: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: widget.actions,
          title: widget.title ?? '',
          episode: widget.episode,
        );
      },
      onLongPressStart: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: widget.actions,
          title: widget.title ?? '',
          episode: widget.episode,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: widget.bannerImage != null
              ? DecorationImage(
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.bannerImage!),
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
                widget.title ?? 'N/A',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              leading: widget.coverImage != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(widget.coverImage!),
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
                  /// Tags
                  if (widget.tags != null)
                    ...(widget.tags!.length > 1
                            ? widget.tags!.sublist(0, 2)
                            : widget.tags!)
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
