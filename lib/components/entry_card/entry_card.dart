import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/entry_card/entry_card_action.dart';
import 'package:anikki/components/entry_card/entry_card_bookmark.dart';
import 'package:anikki/components/entry_card/entry_card_completed.dart';
import 'package:anikki/components/expandable_fab.dart';
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
      onTap: () {
        if (Platform.isIOS) {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  title: Text(
                      title + (episode != null ? ' - Episode $episode' : '')),
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
        }
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
              child: Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniEndFloat,
                floatingActionButton: !Platform.isIOS
                    ? ExpandableFab(
                        distance: 80,
                        children: actions
                            .map((e) => ActionButton(
                                  icon: e.icon,
                                  onPressed: () => e.callback(context),
                                  tooltipText: e.label,
                                ))
                            .toList(),
                      )
                    : null,
                body: Stack(
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
                        left: 10,
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
          ),
          ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
