part of 'media_details_episode.dart';

class MediaDetailsEpisodeTitle extends StatelessWidget {
  const MediaDetailsEpisodeTitle({
    super.key,
    required this.info,
    required this.index,
    this.textAlign = TextAlign.center,
  });

  final Fragment$shortMedia$streamingEpisodes? info;
  final int index;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: AutoSizeText(
        info?.title ?? 'Episode $index',
        maxLines: 2,
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: textAlign,
      ),
    );
  }
}
