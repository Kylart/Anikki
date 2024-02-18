part of 'media_details_episode.dart';

class MediaDetailsEpisodeCover extends StatefulWidget {
  const MediaDetailsEpisodeCover({
    super.key,
    this.episodeCover,
  });

  final String? episodeCover;

  @override
  State<MediaDetailsEpisodeCover> createState() =>
      _MediaDetailsEpisodeCoverState();
}

class _MediaDetailsEpisodeCoverState extends State<MediaDetailsEpisodeCover> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    if (widget.episodeCover != null && !isError) {
      return AspectRatio(
        aspectRatio: 16 / 10,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 200,
            maxHeight: 125,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: FractionalOffset.center,
              image: NetworkImage(widget.episodeCover!),
              onError: (exception, stackTrace) {
                setState(() {
                  isError = true;
                });
              },
            ),
          ),
        ),
      );
    } else {
      return Image.asset(
        'assets/images/cover_placeholder.jpg',
        width: 200,
      );
    }
  }
}
