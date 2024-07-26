import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view.dart';
import 'package:anikki/app/home/widgets/home_image.dart';
import 'package:anikki/app/media_details/widgets/media_details_trailer.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/data/anilist/models/schema.graphql.dart';
import 'package:anikki/domain/domain.dart';

part 'home_entry_expanded.dart';

class HomeEntry extends StatelessWidget {
  const HomeEntry({
    super.key,
    required this.media,
    required this.expanded,
    this.customTags = const [],
    this.onExpanded,
  });

  final Media media;
  final bool expanded;
  final List<String> customTags;
  final void Function(GlobalObjectKey key)? onExpanded;

  static get grayscaledKey => const ValueKey('grayscaled');
  static get colouredKey => const ValueKey('coloured');
  GlobalObjectKey get _key => GlobalObjectKey(media.anilistInfo.id);

  final animationDuration = const Duration(milliseconds: 300);

  static get nonExpandedAspectRatio => 9 / 26;
  static get expandedAspectRatio => 16 / 9;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      key: _key,
      onEnd: onExpanded != null ? () => onExpanded!(_key) : null,
      duration: animationDuration,
      width: expanded
          ? HomeScrollView.getHeight(context) * expandedAspectRatio
          : HomeScrollView.getHeight(context) * nonExpandedAspectRatio,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.all(Radius.circular(expanded ? 12.0 : 0)),
        border: Border.all(
          color: expanded ? context.colorScheme.outline : Colors.transparent,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      child: AnimatedSwitcher(
        duration: animationDuration,
        transitionBuilder: (child, animation) => child.key == grayscaledKey
            ? child
            : FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              ),
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: previousChildren
                    .map(
                      (e) => Expanded(child: e),
                    )
                    .toList(),
              ),
              if (currentChild != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: currentChild),
                  ],
                ),
            ],
          );
        },
        child: expanded
            ? _HomeEntryExpanded(
                key: colouredKey,
                media: media,
                customTags: customTags,
              )
            : HomeImage(
                key: grayscaledKey,
                media: media,
                grayscaled: true,
              ),
      ),
    );
  }
}
