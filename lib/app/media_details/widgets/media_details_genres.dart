part of 'media_details.dart';

class MediaDetailsGenres extends StatelessWidget {
  const MediaDetailsGenres({
    super.key,
    required this.genres,
    this.color,
  });

  final Iterable<String>? genres;
  final String? color;

  @override
  Widget build(BuildContext context) {
    if (genres == null || genres!.isEmpty) return const SizedBox();

    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 4.0,
      spacing: 4.0,
      children: genres!.map(
        (genre) {
          return EntryTag(
            blurLevel: 0,
            color: Colors.transparent,
            child: Text(genre),
          );
        },
      ).toList(),
    );
  }
}
