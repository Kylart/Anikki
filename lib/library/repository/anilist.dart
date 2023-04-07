part of 'repository.dart';

Future<void> updateEntry(BuildContext context, LocalFile entry) async {
  final auth = BlocProvider.of<AnilistAuthBloc>(context);
  final lists = BlocProvider.of<WatchListBloc>(context);
  final scaffold = ScaffoldMessenger.of(context);
  final theme = Theme.of(context);
  final anilist = Anilist(client: getAnilistClient());

  if (!auth.isConnected) return;

  if (entry.media?.id != null) {
    final episode = entry.episode ?? 1;

    try {
      await anilist.watchedEntry(
        episode: episode,
        mediaId: entry.media!.id,
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
