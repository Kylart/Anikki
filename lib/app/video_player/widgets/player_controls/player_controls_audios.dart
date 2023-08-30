part of 'player_controls.dart';

class PlayerControlsAudios extends StatefulWidget {
  const PlayerControlsAudios({super.key, required this.player});

  final Player player;

  @override
  State<PlayerControlsAudios> createState() => _PlayerControlsAudiosState();
}

class _PlayerControlsAudiosState extends State<PlayerControlsAudios> {
  List<AudioTrack>? available;
  AudioTrack? selected;

  @override
  void initState() {
    super.initState();

    widget.player.stream.tracks.listen((track) {
      setState(() {
        available = track.audio;
      });
    });

    widget.player.stream.track.listen((event) {
      setState(() {
        selected = event.audio;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (available == null || available!.isEmpty) return const SizedBox();

    return PopupMenuButton(
      tooltip: 'Audio',
      icon: const Icon(Ionicons.musical_note_outline),
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
              widget.player.setAudioTrack(track);
            },
          );
        }).toList();
      },
    );
  }
}
