part of 'home_title.dart';

class _HomeTitleSubtitle extends StatelessWidget {
  const _HomeTitleSubtitle({
    required this.media,
  });

  final Media media;

  TextSpan get separator => const TextSpan(
        text: ' • ',
      );

  String? get season {
    if (media.anilistInfo.seasonYear == null ||
        media.anilistInfo.season == null) {
      return null;
    }

    return [
      media.anilistInfo.season!.name.capitalize(),
      media.anilistInfo.seasonYear.toString(),
    ].join(' ');
  }

  int? get episodes => media.anilistInfo.episodes;

  List<String>? get genres =>
      media.anilistInfo.genres?.whereType<String>().toList();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textTheme.bodyLarge,
        children: [
          if (season != null)
            TextSpan(
              text: season,
            ),
          if (episodes != null && episodes != 0) ...[
            separator,
            TextSpan(
              text: '$episodes episode${episodes == 1 ? '' : 's'}',
            ),
          ],
          if (genres?.isNotEmpty == true) ...[
            separator,
            TextSpan(
              text: genres!
                  .sublist(
                    0,
                    min(genres!.length, 2),
                  )
                  .join(' • '),
            ),
          ]
        ],
      ),
    );
  }
}
