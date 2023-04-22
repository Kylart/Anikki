import 'package:flutter/material.dart';

import 'package:anikki/models/anikki_action.dart';
import 'package:anikki/widgets/entry_card/entry_card_cover.dart';
import 'package:anikki/widgets/anikki_icon.dart';
import 'package:anikki/helpers/show_entry_context_menu.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({
    super.key,
    this.actions = const [],
    required this.title,
    this.coverImage,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
    this.isExpandable = false,
  });

  final List<AnikkiAction> actions;
  final String title;
  final String? coverImage;
  final String? episode;
  final bool showBookmark;
  final bool showDone;

  /// For expandable cards
  final bool isExpandable;

  @override
  Widget build(BuildContext context) {
    final cover = EntryCardCover(
      coverImage: coverImage,
      showBookmark: showBookmark,
      showDone: showDone,
      episode: episode,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => actions[0].callback(context),
        onSecondaryTapUp: (details) {
          showEntryContextMenu(
            offset: details.globalPosition,
            context: context,
            actions: actions,
            title: title,
          );
        },
        onLongPressStart: (details) {
          showEntryContextMenu(
            offset: details.globalPosition,
            context: context,
            actions: actions,
            title: title,
          );
        },
        child: Column(
          children: [
            if (!isExpandable)
              Expanded(
                child: cover,
              )
            else
              Expanded(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0, top: 3.0),
                        child: cover,
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0, top: 6.0),
                        child: cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0, top: 9.0),
                      child: cover,
                    ),
                  ],
                ),
              ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              title: Tooltip(
                message: title,
                child: Opacity(
                  opacity: 0.7,
                  child: Text(
                    '$title\n',
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTapUp: (details) {
                          showEntryContextMenu(
                            offset: details.globalPosition,
                            context: context,
                            actions: actions,
                            title: title,
                          );
                        },
                        child: const AnikkiIcon(
                          icon: Icons.more_vert,
                        ),
                      ),
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
