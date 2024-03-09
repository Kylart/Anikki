part of 'player_controls.dart';

class PlayerControlsTitle extends StatelessWidget {
  const PlayerControlsTitle({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Playlist>(
      stream: player.stream.playlist,
      builder: (BuildContext context, AsyncSnapshot<Playlist> snapshot) {
        final currentMedia = player.state.playlist.medias
            .elementAtOrNull(player.state.playlist.index);
        final String? title = currentMedia?.extras?['title'] ?? 'N/A';

        if (title == null) return const SizedBox();

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          child: AutoSizeText(
            title,
            maxLines: 1,
          ),
        );
      },
    );
  }
}
