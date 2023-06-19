part of 'entry_card_overlay_episode.dart';

class EntryCardOverlayEpisodeCover extends StatefulWidget {
  const EntryCardOverlayEpisodeCover({
    super.key,
    this.episodeCover,
  });

  final String? episodeCover;

  @override
  State<EntryCardOverlayEpisodeCover> createState() => _EntryCardOverlayEpisodeCoverState();
}

class _EntryCardOverlayEpisodeCoverState extends State<EntryCardOverlayEpisodeCover> {
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
