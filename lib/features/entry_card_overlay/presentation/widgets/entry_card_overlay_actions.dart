import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/features/entry_card_overlay/domain/domain.dart';
import 'package:anikki/features/library/domain/models/library_entry.dart';
import 'package:anikki/features/downloader/presentation/bloc/downloader_bloc.dart';

class EntryCardOverlayActions extends StatelessWidget {
  const EntryCardOverlayActions({
    super.key,
    this.media,
    this.entry,
  });

  final Fragment$shortMedia? media;
  final LibraryEntry? entry;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EntryTag(
          padding: EdgeInsets.zero,
          child: FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
            label: const Text('Play'),
          ),
        ),
        const Spacer(),
        EntryTag(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              overlayAction(() {
                if (media == null) return;

                BlocProvider.of<DownloaderBloc>(context).add(
                  DownloaderRequested(
                    context: context,
                    media: media!,
                    entry: entry,
                  ),
                );
              }, context);
            },
            icon: const Icon(Icons.file_download_outlined),
          ),
        ),
        if (media?.siteUrl != null)
          EntryTag(
            padding: EdgeInsets.zero,
            child: IconButton(
              onPressed: () {
                openInBrowser(media?.siteUrl);
              },
              icon: const Icon(SimpleIcons.anilist),
            ),
          ),
        if (media?.idMal != null)
          EntryTag(
            padding: EdgeInsets.zero,
            child: IconButton(
              onPressed: () {
                if (media?.idMal == null) return;
                openInBrowser('https://myanimelist.net/anime/${media!.idMal!}');
              },
              icon: const Icon(SimpleIcons.myanimelist),
            ),
          ),
      ],
    );
  }
}
