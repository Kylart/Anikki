part of 'entry_card_overlay_episode.dart';

class EntryCardOverlayEpisodeCompleted extends StatelessWidget {
  const EntryCardOverlayEpisodeCompleted({
    super.key,
    required this.media,
    required this.index,
  });

  final Media media;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        if (state is! WatchListComplete) return const SizedBox();

        final completedEntry = state.completed.firstWhereOrNull(
            (element) => element.media?.id == media.anilistInfo.id);
        final currentEntry = state.current.firstWhereOrNull(
            (element) => element.media?.id == media.anilistInfo.id);

        final seen =
            completedEntry != null || (currentEntry?.progress ?? -1) >= index;

        if (!seen) return const SizedBox();

        return const EntryCardCompleted(
          dense: true,
        );
      },
    );
  }
}
