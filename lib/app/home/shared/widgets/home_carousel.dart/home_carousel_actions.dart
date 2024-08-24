part of 'home_carousel.dart';

class _HomeCarouselActions extends StatefulWidget {
  const _HomeCarouselActions({
    required this.media,
    required this.numberOfItems,
    required this.goToItem,
  });

  final Media media;
  final int numberOfItems;
  final void Function(int index, {bool resetTimer}) goToItem;

  @override
  State<_HomeCarouselActions> createState() => _HomeCarouselActionsState();
}

class _HomeCarouselActionsState extends State<_HomeCarouselActions> {
  bool _isToggleFavouriteLoading = false;

  bool get isToggleFavouriteLoading => _isToggleFavouriteLoading;

  set isToggleFavouriteLoading(bool value) {
    setState(() {
      _isToggleFavouriteLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (isToggleFavouriteLoading && state is HomeLoaded) {
          isToggleFavouriteLoading = false;
        }
      },
      child: Row(
        children: [
          FilledButton.tonalIcon(
            onPressed: () => widget.goToItem(
              Random().nextInt(widget.numberOfItems - 1),
              resetTimer: true,
            ),
            icon: const Icon(HugeIcons.strokeRoundedShuffle),
            label: const Text('Random'),
          ),
          const SizedBox(
            width: 8.0,
          ),
          FilledButton(
            onPressed: () => {},
            child: const Icon(
              HugeIcons.strokeRoundedBookmarkMinus01,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          FilledButton(
            onPressed: () {
              isToggleFavouriteLoading = true;

              BlocProvider.of<WatchListBloc>(context).add(
                WatchListToggleFavourite(
                  mediaId: widget.media.anilistInfo.id,
                ),
              );
            },
            child: AnimatedCrossFade(
              firstChild: Container(
                padding: const EdgeInsets.all(2.0),
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: context.colorScheme.onPrimary,
                  strokeWidth: 2.0,
                ),
              ),
              secondChild: Icon(
                widget.media.anilistInfo.isFavourite == true
                    ? Icons.favorite
                    : HugeIcons.strokeRoundedFavourite,
                color: widget.media.anilistInfo.isFavourite == true
                    ? Colors.red
                    : null,
              ),
              crossFadeState: isToggleFavouriteLoading
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
            ),
          ),
        ],
      ),
    );
  }
}
