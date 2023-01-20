import 'package:flutter/material.dart';

import 'package:kawanime/components/news/news_card_actions.dart';
import 'package:kawanime/components/shared/entry_card/entry_card_background.dart';
import 'package:kawanime/components/user_list/local_card_actions.dart';
import 'package:kawanime/providers/anilist/types/schedule_entry.dart';
import 'package:kawanime/providers/local/types/file.dart';

enum CardType { local, news, watchList }

class EntryCard<T> extends StatefulWidget {
  const EntryCard({super.key, required this.entry, required this.type});

  final T entry;
  final CardType type;

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
    final entry = widget.entry;
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.romaji ??
        entry.media?.title?.english ??
        entry.title;

    Widget actions = const SizedBox();

    switch (widget.type) {
      case CardType.local:
        actions = LocalCardActions(
          entry: entry as LocalFile,
          onBack: () {
            setState(() {
              isClicked = false;
            });
          },
        );
        break;

      case CardType.news:
        actions = NewsCardActions(
          entry: entry as ScheduleEntry,
          onBack: () {
            setState(() {
              isClicked = false;
            });
          },
        );
        break;

      case CardType.watchList:
        actions = const SizedBox();
        break;
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
          image: coverImage != null
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(coverImage),
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
            AnimatedOpacity(
                duration: transitionDuration,
                opacity: isHovered ? 0 : 1,
                child: EntryCardBackground(
                  title: title,
                  episode: entry.episode?.toString(),
                )),
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
