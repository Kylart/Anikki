part of 'home_entry.dart';

class _HomeEntryExpanded extends StatelessWidget {
  const _HomeEntryExpanded({
    super.key,
    required this.media,
    this.customTags = const [],
  });

  final Media media;
  final List<String> customTags;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeImage(
          key: HomeEntry.grayscaledKey,
          media: media,
          grayscaled: false,
        ),
        VerticalDivider(
          width: 1,
          color: context.colorScheme.outline,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  title: Text(
                    media.title ?? 'N/A',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: media.anilistInfo.title?.native == null
                      ? const SizedBox()
                      : Text(
                          media.anilistInfo.title!.native!,
                          textAlign: TextAlign.center,
                        ),
                ),
                Divider(
                  color: context.colorScheme.outline,
                ),
                const Spacer(),
                SizedBox(
                  height: HomeScrollView.getHeight(context) / 2.2,
                  child: MediaDetailsTrailer(media: media),
                ),
                const Spacer(),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    for (final customTag in customTags)
                      EntryTag(
                        blurLevel: 0,
                        child: Text(customTag),
                      ),
                    if (media.anilistInfo.episodes != null ||
                        media.anilistInfo.nextAiringEpisode?.episode != null)
                      EntryTag(
                        blurLevel: 0,
                        child: Text(
                            '${media.anilistInfo.episodes ?? media.anilistInfo.nextAiringEpisode?.episode} episodes'),
                      ),
                    switch (media.anilistInfo.status) {
                      null || Enum$MediaStatus.$unknown => const SizedBox(),
                      Enum$MediaStatus.FINISHED => const EntryTag(
                          blurLevel: 0,
                          child: Text('Finished'),
                        ),
                      Enum$MediaStatus.RELEASING => const EntryTag(
                          blurLevel: 0,
                          child: Text('Releasing'),
                        ),
                      Enum$MediaStatus.NOT_YET_RELEASED => const EntryTag(
                          blurLevel: 0,
                          child: Text('To be released'),
                        ),
                      Enum$MediaStatus.CANCELLED => const EntryTag(
                          blurLevel: 0,
                          child: Text('Cancelled'),
                        ),
                      Enum$MediaStatus.HIATUS => const EntryTag(
                          blurLevel: 0,
                          child: Text('Paused'),
                        ),
                    },
                  ],
                ),
                const Spacer(),
                Divider(
                  color: context.colorScheme.outline,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FilledButton.tonalIcon(
                      style: FilledButton.styleFrom(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      onPressed: () {
                        VideoPlayerRepository.playAnyway(
                          context: context,
                          media: media.anilistInfo,
                        );
                      },
                      icon: const Icon(Ionicons.play),
                      label: const Text('Watch'),
                    ),
                    IconButton.outlined(
                      onPressed: () {
                        BlocProvider.of<DownloaderBloc>(context).add(
                          DownloaderRequested(
                            media: media.anilistInfo,
                          ),
                        );
                      },
                      icon: const Icon(Ionicons.download_outline),
                    ),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.ellipsis_horizontal_outline,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
