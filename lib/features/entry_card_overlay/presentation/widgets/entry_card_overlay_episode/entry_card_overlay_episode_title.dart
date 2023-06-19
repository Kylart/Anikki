part of 'entry_card_overlay_episode.dart';

class EntryCardOverlayEpisodeTitle extends StatelessWidget {
  const EntryCardOverlayEpisodeTitle({
    super.key,
    required this.info,
    required this.index,
  });

  final Fragment$shortMedia$streamingEpisodes? info;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: AutoSizeText(
        info?.title ?? 'Episode $index',
        maxLines: 2,
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
