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
    this.customTags = const [],
    this.onExpanded,
  });

  final Media media;
  final List<String> customTags;
  final void Function(GlobalObjectKey key)? onExpanded;

  static get grayscaledKey => const ValueKey('grayscaled');
  static get colouredKey => const ValueKey('coloured');

  final animationDuration = const Duration(milliseconds: 300);

  static get expandedAspectRatio => 16 / 9;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HomeScrollView.getHeight(context) * expandedAspectRatio,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
          color: context.colorScheme.outline,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      child: _HomeEntryExpanded(
        key: colouredKey,
        media: media,
        customTags: customTags,
      ),
    );
  }
}
