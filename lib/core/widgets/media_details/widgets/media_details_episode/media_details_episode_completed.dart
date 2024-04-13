part of 'media_details_episode.dart';

class MediaDetailsEpisodeCompleted extends StatelessWidget {
  const MediaDetailsEpisodeCompleted({
    super.key,
    required this.media,
    required this.index,
  });

  final Media media;
  final int index;

  bool hasMedia(AnilistWatchListEntry element) {
    return element.media?.id == media.anilistInfo.id;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        final completedEntry = AnilistUtils.getCompletedEntry(state, media);
        final currentEntry = AnilistUtils.getCurrentEntry(state, media);

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
