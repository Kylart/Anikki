import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/helpers/anilist/anilist_client.dart';
import 'package:anikki/models/local_file.dart';

Future<void> updateEntry(
  BuildContext context,
  LocalFile entry, [
  Anilist? client,
]) async {
  final auth = BlocProvider.of<AnilistAuthBloc>(context);
  final lists = BlocProvider.of<WatchListBloc>(context);
  final scaffold = ScaffoldMessenger.of(context);
  final theme = Theme.of(context);
  final anilist = client ?? Anilist(client: getAnilistClient());

  if (!auth.isConnected) return;

  if (entry.media?.id != null) {
    final episode = entry.episode ?? 1;

    try {
      await anilist.watchedEntry(
        episode: episode,
        mediaId: entry.media!.id,
        status: episode == 1 ? Enum$MediaListStatus.CURRENT : null,
      );

      scaffold.showSnackBar(
        SnackBar(
          backgroundColor: theme.colorScheme.background,
          content: ListTile(
            title: const Text('Anilist list updated!'),
            subtitle: Text(
                'Updated ${entry.media?.title?.userPreferred} with episode $episode.'),
          ),
        ),
      );

      lists.add(
        WatchListRequested(
            username: (auth.state as AnilistAuthSuccess).me.name),
      );
    } on AnilistUpdateListException catch (e) {
      _handleAnilistUpdateException(e, context);
    }
  }
}

void _handleAnilistUpdateException(
    AnilistUpdateListException error, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error,
      content: ListTile(
        title: Text(error.cause),
        subtitle: Text('Error was ${error.error}.'),
      ),
    ),
  );
}
