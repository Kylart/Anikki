import 'dart:math';

import 'package:anikki/app/media_dialog/shared/show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        onPressed: () => playAnyway(
          context: context,
          media: media.anilistInfo,
          entry: entry,
        ),
        icon: const Icon(Icons.play_arrow),
        label: const Text('Play'),
      ),
      if (showExpand)
        EntryTag(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              showMediaDialog(context, media);
            },
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: const Icon(
                CupertinoIcons.arrow_up_left_arrow_down_right,
              ),
            ),
          ),
        ),
      const Spacer(),
      EntryTag(
        padding: EdgeInsets.zero,
        child: IconButton(
          onPressed: () {
            BlocProvider.of<DownloaderBloc>(context).add(
              DownloaderRequested(
                media: media.anilistInfo,
                entry: entry,
              ),
            );
          },
          icon: const Icon(Icons.file_download_outlined),
        ),
      ),
      if (media.anilistInfo.siteUrl != null)
        EntryTag(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              openInBrowser(media.anilistInfo.siteUrl);
            },
            icon: const Icon(SimpleIcons.anilist),
          ),
        ),
      if (media.anilistInfo.idMal != null)
        EntryTag(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              if (media.anilistInfo.idMal == null) return;
              openInBrowser(
                  'https://myanimelist.net/anime/${media.anilistInfo.idMal!}');
            },
            icon: const Icon(SimpleIcons.myanimelist),
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
