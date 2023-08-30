part of 'media_dialog_episode.dart';

class MediaDialogEpisodePortrait extends StatelessWidget {
  const MediaDialogEpisodePortrait({
    super.key,
    required this.episodeCover,
    required this.info,
    required this.index,
    required this.isNextAiringEpisode,
    required this.aired,
    required this.media,
    required this.entry,
  });

  final String? episodeCover;
  final Fragment$shortMedia$streamingEpisodes? info;
  final int index;
  final bool isNextAiringEpisode;
  final bool aired;
  final Media media;
  final LibraryEntry? entry;

  @override
  Widget build(BuildContext context) {
    LocalFile? localFile =
        entry?.entries.firstWhereOrNull((element) => element.episode == index);

    if (media.anilistInfo.format == Enum$MediaFormat.MOVIE &&
        entry != null &&
        localFile == null) {
      localFile = entry?.entries.first;
    }

    return ListTile(
      leading: episodeCover != null
          ? Stack(
              children: [
                CircleAvatar(
                  backgroundImage: (episodeCover == null
                      ? const AssetImage('assets/images/cover_placeholder.jpg')
                      : NetworkImage(episodeCover!)) as ImageProvider,
                ),
                const Positioned.fill(
                  child: Center(
                    child: EntryTag(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Ionicons.play,
                        size: 12,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
      title: MediaDialogEpisodeTitle(
        info: info,
        index: index,
        textAlign: TextAlign.start,
      ),
      trailing: aired
          ? MediaDialogEpisodeActions(
              media: media,
              index: index,
              entry: entry,
              localFile: localFile,
              info: info,
              mainAxisSize: MainAxisSize.min,
            )
          : Icon(isNextAiringEpisode
              ? Ionicons.alarm_outline
              : Ionicons.ban_outline),
      subtitle: isNextAiringEpisode
          ? const Text('Not aired yet')
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MediaDialogEpisodeCompleted(
                  media: media,
                  index: index,
                ),
              ],
            ),
      onTap: () {
        playAnyway(
          context: context,
          media: media.anilistInfo,
          entry: entry,
          episode: index,
        );
      },
    );
  }
}
