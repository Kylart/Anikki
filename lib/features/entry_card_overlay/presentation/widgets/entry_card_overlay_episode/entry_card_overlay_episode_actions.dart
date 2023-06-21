part of 'entry_card_overlay_episode.dart';

class EntryCardOverlayEpisodeActions extends StatelessWidget {
  const EntryCardOverlayEpisodeActions({
    super.key,
    required this.media,
    required this.index,
    required this.entry,
    required this.info,
    this.mainAxisSize = MainAxisSize.max,
  });

  final Media media;
  final int index;
  final LibraryEntry? entry;
  final Fragment$shortMedia$streamingEpisodes? info;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    LocalFile? localFile =
        entry?.entries.firstWhereOrNull((element) => element.episode == index);

    if (media.anilistInfo.format == Enum$MediaFormat.MOVIE &&
        entry != null &&
        localFile == null) {
      localFile = entry?.entries.first;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: mainAxisSize,
      children: [
        if (localFile != null) ...[
          IconButton(
            onPressed: () {
              BlocProvider.of<LibraryBloc>(context).add(
                LibraryFileDeleteRequested(
                  context: context,
                  file: localFile!,
                ),
              );
            },
            iconSize: 18.0,
            constraints: const BoxConstraints(),
            color: Colors.red,
            icon: const Icon(Icons.delete_forever_rounded),
          ),
          Tooltip(
            message: 'Open in Explorer',
            child: IconButton(
              onPressed: () {
                openFolderInExplorer(context);
              },
              iconSize: 18.0,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.folder),
            ),
          ),
        ] else
          IconButton(
            onPressed: () {
              BlocProvider.of<DownloaderBloc>(context).add(
                DownloaderRequested(
                  context: context,
                  media: media.anilistInfo,
                  episode: index,
                  entry: entry,
                ),
              );
            },
            iconSize: 18.0,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.download_rounded),
          ),
        if (info?.url != null && info?.site != null)
          Tooltip(
            message: 'See on ${info!.site}',
            child: IconButton(
              iconSize: 18.0,
              constraints: const BoxConstraints(),
              onPressed: () {
                openInBrowser(info?.url);
              },
              icon: const Icon(
                SimpleIcons.crunchyroll,
                color: Color(0xFFF47521),
              ),
            ),
          ),
        IconButton.filledTonal(
          onPressed: () {
            if (localFile != null) {
              BlocProvider.of<VideoPlayerBloc>(context).add(
                VideoPlayerPlayRequested(
                  context: context,
                  sources: entry!.entries.map((e) => e.path).toList(),
                  first: localFile,
                  onVideoComplete: (media) {
                    updateEntry(context, localFile!);
                  },
                ),
              );
            }
          },
          icon: const Icon(Icons.play_arrow),
        ),
      ],
    );
  }
}
