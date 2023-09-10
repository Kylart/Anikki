import 'dart:math';

import 'package:anikki/app/media_dialog/shared/show.dart';
import 'package:anikki/core/widgets/anikki_icon.dart';
import 'package:anikki/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';

class MediaDialogActions extends StatelessWidget {
  const MediaDialogActions({
    super.key,
    required this.media,
    this.entry,
    this.reversed = false,
    this.showExpand = false,
  });

  final Media media;
  final LibraryEntry? entry;
  final bool reversed;
  final bool showExpand;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();

    final children = [
      FilledButton.tonalIcon(
        style: FilledButton.styleFrom(
            side: BorderSide(color: Theme.of(context).colorScheme.outline)),
        onPressed: () => VideoPlayerRepository.playAnyway(
          context: context,
          media: media.anilistInfo,
          entry: entry,
        ),
        icon: const Icon(Ionicons.play),
        label: const Text('Play'),
      ),
      if (showExpand)
        EntryTag(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              showMediaDialog(context, media, entry);
            },
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: const Icon(
                Ionicons.expand_outline,
              ),
            ),
          ),
        ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: IconButton.outlined(
          onPressed: () {
            BlocProvider.of<DownloaderBloc>(context).add(
              DownloaderRequested(
                media: media.anilistInfo,
                entry: entry,
              ),
            );
          },
          icon: const AnikkiIcon(icon: Ionicons.download_outline),
        ),
      ),
      if (media.anilistInfo.siteUrl != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: IconButton.outlined(
            onPressed: () {
              openInBrowser(media.anilistInfo.siteUrl);
            },
            icon: const AnikkiIcon(icon: SimpleIcons.anilist),
          ),
        ),
      if (media.anilistInfo.idMal != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: IconButton.outlined(
            onPressed: () {
              if (media.anilistInfo.idMal == null) return;
              openInBrowser(
                  'https://myanimelist.net/anime/${media.anilistInfo.idMal!}');
            },
            icon: const AnikkiIcon(icon: SimpleIcons.myanimelist),
          ),
        ),
    ];

    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: reversed ? children.reversed.toList() : children,
    );
  }
}
