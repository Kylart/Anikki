part of 'media_details_episode.dart';

class MediaDetailsEpisodeCompleted extends StatelessWidget {
  const MediaDetailsEpisodeCompleted({
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
        final completedEntry = state.completed.firstWhereOrNull(
            (element) => element.media?.id == media.anilistInfo.id);
        final currentEntry = state.current.firstWhereOrNull(
            (element) => element.media?.id == media.anilistInfo.id);

        final seen =
            completedEntry != null || (currentEntry?.progress ?? -1) >= index;

        if (!seen) return const SizedBox();

        return const EntryTag(
          color: Colors.black45,
          padding: EdgeInsets.all(2.0),
          outline: Colors.transparent,
          child: Icon(
            Ionicons.checkmark_outline,
            color: Colors.green,
            size: 12.0,
          ),
        );
      },
    );
  }
}
