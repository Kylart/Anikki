part of 'drawer_content.dart';

class DrawerEpisodeCompleted extends StatelessWidget {
  const DrawerEpisodeCompleted({
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
        final completedEntry = AnilistUtils.getCompletedEntry(
          state.watchList,
          media,
        );
        final currentEntry = AnilistUtils.getCurrentEntry(
          state.watchList,
          media,
        );

        final seen =
            completedEntry != null || (currentEntry?.progress ?? -1) >= index;

        if (!seen) return const SizedBox();

        return const EntryTag(
          color: Colors.black45,
          padding: EdgeInsets.all(2.0),
          outline: Colors.transparent,
          child: Icon(
            HugeIcons.strokeRoundedTickDouble01,
            color: Colors.green,
            size: 16.0,
          ),
        );
      },
    );
  }
}
