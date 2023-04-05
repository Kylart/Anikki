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

  @override
  void initState() {
    super.initState();

    widget.player.streams.tracks.listen((track) {
      setState(() {
        available = track.subtitle;
      });
    });

    widget.player.streams.track.listen((event) {
      setState(() {
        selected = event.subtitle;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (available == null || available!.isEmpty) return const SizedBox();

    return PopupMenuButton(
      icon: const Icon(Icons.subtitles_outlined),
      itemBuilder: (context) {
        return available!
            .map(
              (track) => PopupMenuItem(
                child: ListTile(
                  title: Text(track.title ?? track.language ?? track.id),
                  textColor: track == selected
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                onTap: () {
                  widget.player.setSubtitleTrack(track);
                },
              ),
            )
            .toList();
      },
    );
  }
}
