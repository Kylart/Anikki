import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/entry_card/entry_card_action.dart';
import 'package:anikki/components/entry_card/entry_card_bookmark.dart';
import 'package:anikki/components/entry_card/entry_card_completed.dart';
import 'package:anikki/components/frosted_circle.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({
    super.key,
    this.actions = const [],
    required this.title,
    this.coverImage,
    this.episode,
    this.showBookmark = false,
    this.showDone = false,
  });

  final List<EntryCardAction> actions;
  final String title;
  final String? coverImage;
  final String? episode;
  final bool showBookmark;
  final bool showDone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => actions[0].callback(context),
      onSecondaryTapUp: (details) {
        showContextMenu(
          details: details,
          context: context,
          actions: actions,
          title: title,
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  /// Cover image or placeholder image
                  if (coverImage != null)
                    Image.network(
                      coverImage!,
                      fit: BoxFit.fill,
                    )
                  else
                    Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        'assets/images/placeholder.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),

                  /// Show only if followed
                  if (showBookmark)
                    const Positioned(
                      right: 10,
                      top: 10,
                      child: EntryCardBookmark(),
                    ),

                  /// Show if entry has been seen
                  if (showDone)
                    const Positioned(
                      right: 10,
                      top: 10,
                      child: EntryCardCompleted(),
                    ),

                  /// Show episode
                  if (episode != null)
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: FrostedCircle(
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              episode!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            title: Text(
              '$title\n',
              style: Theme.of(context).textTheme.titleSmall,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FrostedCircle(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Material(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTapUp: (details) {
                            showContextMenu(
                              details: details,
                              context: context,
                              actions: actions,
                              title: title,
                            );
                          },
                          child: const Icon(
                            Icons.more_vert,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showContextMenu({
  required TapUpDetails details,
  required BuildContext context,
  required List<EntryCardAction> actions,
  required String title,
  String? episode,
}) {
  if (Platform.isIOS) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text(
              title + (episode != null ? ' - Episode $episode' : ''),
            ),
            actions: actions
                .map((action) => CupertinoActionSheetAction(
                      child: Row(children: [
                        const Spacer(),
                        Text(action.label),
                        const Spacer(),
                        Icon(action.icon),
                      ]),
                      onPressed: () => action.callback(context),
                    ))
                .toList(),
          );
        });
  } else if (Platform.isAndroid) {
    showModalBottomSheet(
        enableDrag: false,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: actions
                  .map(
                    (e) => ListTile(
                      leading: Icon(e.icon),
                      title: Text(e.label),
                      onTap: () => e.callback(context),
                    ),
                  )
                  .toList(),
            ),
          );
        });
  } else {
    showMenu(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        MediaQuery.of(context).size.width - details.globalPosition.dx,
        0,
      ),
      items: actions
          .map(
            (e) => PopupMenuItem(
              child: ListTile(
                hoverColor: Colors.transparent,
                onTap: () => e.callback(context),
                title: Text(e.label),
                leading: Icon(e.icon),
              ),
            ),
          )
          .toList(),
    );
  }
}
