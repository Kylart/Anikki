part of 'media_dialog_episode.dart';

class MediaDialogEpisodeLandscape extends StatelessWidget {
  const MediaDialogEpisodeLandscape({
    super.key,
    required this.episodeCover,
    required this.info,
    required this.index,
    required this.entry,
    this.isNextAiringEpisode = false,
    this.aired = false,
    this.media,
    this.file,
  });

  final String? episodeCover;
  final Fragment$shortMedia$streamingEpisodes? info;
  final int index;
  final bool isNextAiringEpisode;
  final bool aired;
  final Media? media;
  final LibraryEntry? entry;
  final LocalFile? file;

  @override
  Widget build(BuildContext context) {
    var localFile = file ??
        entry?.entries.firstWhereOrNull((element) => element.episode == index);

    if (media?.anilistInfo.format == Enum$MediaFormat.MOVIE &&
        entry != null &&
        localFile == null) {
      localFile = entry?.entries.first;
    }

    return LayoutCard(
      child: InkWell(
        onTap: () {
          if (file != null) {
            VideoPlayerRepository.playFile(
              context: context,
              file: file!,
              media: media,
            );
          } else {
            VideoPlayerRepository.playAnyway(
              context: context,
              media: media?.anilistInfo,
              entry: entry,
              episode: index,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediaDialogEpisodeCover(
                    episodeCover: episodeCover,
                  ),
                  MediaDialogEpisodeTitle(
                    info: info,
                    index: index,
                  ),
                  if (isNextAiringEpisode)
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Ionicons.alarm_outline),
                    )
                  else if (aired)
                    MediaDialogEpisodeActions(
                      media: media,
                      index: index,
                      entry: entry,
                      localFile: localFile,
                      info: info,
                    )
                  else
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Ionicons.ban_outline),
                    ),
                ],
              ),
              if (media != null)
                Positioned(
                  top: 5,
                  right: 5,
                  child: MediaDialogEpisodeCompleted(
                    media: media!,
                    index: index,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
