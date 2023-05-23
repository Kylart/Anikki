import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/models/anikki_action.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/features/watch_list/widgets/watch_list_edit.dart';

List<AnikkiAction> getWatchListActions(BuildContext context,
    Query$GetLists$MediaListCollection$lists$entries entry) {
  return [
    AnikkiAction(
      callback: (context) {
        showAnilistEdit(context, entry);
      },
      icon: Icons.edit_outlined,
      label: 'Edit Watch list entry',
    ),
    AnikkiAction(
      callback: (context) {
        BlocProvider.of<DownloaderBloc>(context).add(
          DownloaderRequested(
            context: context,
            media: entry.media,
          ),
        );
      },
      icon: Icons.file_download_outlined,
      label: 'Show torrents',
    ),
    AnikkiAction(
      callback: (context) {
        openInBrowser(entry.media?.siteUrl);
      },
      icon: Icons.open_in_new_outlined,
      label: 'See on Anilist',
    ),
  ];
}

void showAnilistEdit(BuildContext context,
    Query$GetLists$MediaListCollection$lists$entries entry) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: WatchListEdit(entry: entry),
      );
    },
  );
}
