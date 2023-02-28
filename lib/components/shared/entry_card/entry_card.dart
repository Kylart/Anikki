import 'package:flutter/material.dart';

import 'package:anikki/news/news_card_actions.dart';
import 'package:anikki/components/shared/entry_card/entry_card_bookmark.dart';
import 'package:anikki/components/shared/entry_card/entry_card_completed.dart';
import 'package:anikki/library/library_card_actions.dart';
import 'package:anikki/watch_list/watch_list_card_actions.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({
    super.key,
    required this.actions,
    required this.title,
    this.coverImage,
    this.showBookmark = false,
    this.showDone = false,
  });

  final Widget actions;
  final Widget title;
  final String? coverImage;
  final bool showBookmark;
  final bool showDone;

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {
  final transitionDuration = const Duration(milliseconds: 200);

  bool isHovered = false;
  bool isClicked = false;

  bool get showOverlay => isClicked || isHovered;

  @override
  Widget build(BuildContext context) {
    Widget actions = widget.actions;

    if (widget.actions is NewsCardActions) {
      final initActions = widget.actions as NewsCardActions;
      actions = NewsCardActions(
        entry: initActions.entry,
        onBack: () {
          initActions.onBack();
          setState(() {
            isClicked = false;
          });
        },
      );
    } else if (widget.actions is LocalCardActions) {
      final initActions = widget.actions as LocalCardActions;
      actions = LocalCardActions(
        entry: initActions.entry,
        onBack: () {
          initActions.onBack();
          setState(() {
            isClicked = false;
          });
        },
      );
    } else if (widget.actions is WatchListCardActions) {
      final initActions = widget.actions as WatchListCardActions;
      actions = WatchListCardActions(
        entry: initActions.entry,
        onBack: () {
          initActions.onBack();
          setState(() {
            isClicked = false;
          });
        },
      );
    }

    return InkWell(
      onTap: () {
        setState(() {
          isClicked = true;
        });
      },
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          image: widget.coverImage != null
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.coverImage!),
                )
              : const DecorationImage(
                  opacity: 0.7,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/placeholder.png'),
                ),
        ),
        child: Stack(
          children: [
            if (widget.showBookmark)
              Positioned(
                right: 10,
                top: 10,
                child: AnimatedOpacity(
                  duration: transitionDuration,
                  opacity: isHovered ? 0 : 1,
                  child: const EntryCardBookmark(),
                ),
              ),
            if (widget.showDone)
              Positioned(
                right: 10,
                top: 10,
                child: AnimatedOpacity(
                  duration: transitionDuration,
                  opacity: isHovered ? 0 : 1,
                  child: const EntryCardCompleted(),
                ),
              ),
            AnimatedOpacity(
              duration: transitionDuration,
              opacity: isHovered ? 0 : 1,
              child: widget.title,
            ),
            Positioned.fill(
              child: IgnorePointer(
                ignoring: !showOverlay,
                child: AnimatedOpacity(
                  duration: transitionDuration,
                  opacity: showOverlay ? 1 : 0,
                  child: Container(
                    color: Colors.black87,
                    child: actions,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
