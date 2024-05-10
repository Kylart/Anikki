part of 'media_details_episode.dart';

class MediaDetailsEpisodeActions extends StatelessWidget {
  const MediaDetailsEpisodeActions({
    super.key,
    required this.index,
    required this.info,
    this.onPlay,
    this.media,
    this.entry,
    this.localFile,
    this.mainAxisSize = MainAxisSize.max,
  });

  final Media? media;
  final int index;
  final LibraryEntry? entry;
  final Fragment$shortMedia$streamingEpisodes? info;
  final MainAxisSize mainAxisSize;
  final LocalFile? localFile;
  final void Function(BuildContext context)? onPlay;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: mainAxisSize,
      children: [
        if (localFile != null)
          MediaDetailsEpisodeActionDelete(
            file: localFile!,
          )
        else
          IconButton(
            onPressed: () {
              BlocProvider.of<DownloaderBloc>(context).add(
                DownloaderRequested(
                  media: media?.anilistInfo,
                  episode: index,
                  entry: entry,
                ),
              );
            },
            iconSize: 18.0,
            constraints: const BoxConstraints(),
            icon: const Icon(Ionicons.download_outline),
          ),
        if (onPlay != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton.filledTonal(
              onPressed: () => onPlay!(context),
              icon: const Icon(Ionicons.play),
              iconSize: 22.0,
              constraints: const BoxConstraints(),
            ),
          ),
      ],
    );
  }
}
