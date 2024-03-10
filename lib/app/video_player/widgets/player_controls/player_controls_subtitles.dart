part of 'player_controls.dart';

class PlayerControlsSubtitles extends StatefulWidget {
  const PlayerControlsSubtitles({super.key, required this.player});

  final Player player;

  @override
  State<PlayerControlsSubtitles> createState() =>
      _PlayerControlsSubtitlesState();
}

class _PlayerControlsSubtitlesState extends State<PlayerControlsSubtitles> {
  List<SubtitleTrack>? available;
  SubtitleTrack? selected;

  final loadedMediaSubtitles = <Media>[];

  Future<void> loadMediaSubtitles(Playlist playlist) async {
    final currentMedia = playlist.medias.elementAt(
      playlist.index,
    );

    final currentMediaSubtitles = currentMedia.extras?['subtitles'];

    if (currentMediaSubtitles == null) return;

    if (loadedMediaSubtitles.contains(currentMedia)) return;

    for (final subtitle in currentMediaSubtitles as List<VideoSubtitle>) {
      await widget.player.setSubtitleTrack(
        SubtitleTrack.uri(
          subtitle.url,
          title: subtitle.id,
          language: subtitle.lang.substring(0, 2).toLowerCase(),
        ),
      );
    }

    await widget.player.setSubtitleTrack(
      widget.player.state.tracks.subtitle.first,
    );

    loadedMediaSubtitles.add(currentMedia);
  }

  @override
  void initState() {
    super.initState();

    widget.player.stream.duration.listen((duration) {
      if (duration == Duration.zero) return;

      loadMediaSubtitles(widget.player.state.playlist);
    });

    widget.player.stream.tracks.listen((track) {
      if (!mounted) return;

      if (track.subtitle.isNotEmpty) {
        setState(() {
          available = track.subtitle;
        });
      }
    });

    widget.player.stream.track.listen((event) {
      if (!mounted) return;
      setState(() {
        selected = event.subtitle;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (available == null || available!.isEmpty) return const SizedBox();

    return PopupMenuButton(
      tooltip: 'Subtitles',
      icon: const Icon(Ionicons.chatbox_ellipses_outline),
      itemBuilder: (context) {
        return available!.map((track) {
          String title = track.title ?? track.language ?? track.id;

          if (title == 'no') title = 'Disabled';

          return PopupMenuItem(
            child: ListTile(
              title: Text(title),
              textColor: track == selected
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            onTap: () {
              widget.player.setSubtitleTrack(track);
            },
          );
        }).toList();
      },
    );
  }
}
