import 'dart:io';

import 'package:anilist/anilist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/models/anikki_action.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/watch_list/helpers/watch_list_actions.dart';
import 'package:anikki/helpers/anilist/filters/filters.dart';
import 'package:anikki/helpers/open_in_browser.dart';
import 'package:anikki/helpers/show_available_torrents.dart';

List<AnikkiAction> getNewsActions({
  required BuildContext context,
  required Query$AiringSchedule$Page$airingSchedules entry,
}) {
  final isConnected = BlocProvider.of<AnilistAuthBloc>(context).isConnected;
  final listsState = BlocProvider.of<WatchListBloc>(context).state;

  return [
    AnikkiAction(
      label: 'Show torrents',
      icon: Icons.file_download_outlined,
      callback: (_) {
        showAvailableTorrents(context, entry);
      },
    ),
    AnikkiAction(
      label: 'Show all torrents',
      icon: Icons.cloud_download_outlined,
      callback: (context) {
        showAvailableTorrents(
          context,
          entry.copyWith(episode: -1),
        );
      },
    ),
    AnikkiAction(
      callback: (_) {},
      icon: Icons.question_mark,
      type: AnikkiActionType.divider,
      label: '',
    ),
    if (isConnected &&
        listsState.runtimeType == WatchListComplete &&
        isFollowed(listsState as WatchListComplete, entry))
      AnikkiAction(
        label: 'Edit watch list entry',
        icon: CupertinoIcons.pencil,
        callback: (context) {
          final lists = listsState;
          final anilistEntry = [...lists.planning, ...lists.current]
              .where(
                (element) => element.media?.id == entry.media?.id,
              )
              .first;

          showAnilistEdit(context, anilistEntry);
        },
      ),
    AnikkiAction(
      label: 'See on Anilist',
      icon: Platform.isIOS ? CupertinoIcons.arrow_up_right : Icons.open_in_new,
      callback: (context) {
        openInBrowser(entry.media?.siteUrl);
      },
    ),
  ];
}
