part of 'media_dialog_episode.dart';

class MediaDialogEpisodeCover extends StatefulWidget {
  const MediaDialogEpisodeCover({
    super.key,
    this.episodeCover,
  });

  final String? episodeCover;

  @override
  State<MediaDialogEpisodeCover> createState() =>
      _MediaDialogEpisodeCoverState();
}

class _MediaDialogEpisodeCoverState extends State<MediaDialogEpisodeCover> {
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
          child: const Center(
            child: EntryTag(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.play_arrow_rounded,
                size: 34,
              ),
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
