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

        final seen = isSeen(
          state,
          Query$AiringSchedule$Page$airingSchedules(
            id: 0,
            episode: index,
            media: media.anilistInfo,
            airingAt: 0,
          ),
        );

        if (!seen) return const SizedBox();

        return const EntryCardCompleted(
          dense: true,
        );
      },
    );
  }
}
