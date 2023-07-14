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

    widget.player.stream.tracks.listen((track) {
      setState(() {
        available = track.subtitle;
      });
    });

    widget.player.stream.track.listen((event) {
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
      icon: const Icon(Icons.subtitles_outlined),
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
