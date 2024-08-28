part of 'home_carousel.dart';

class _HomeCarouselActions extends StatefulWidget {
  const _HomeCarouselActions({
    required this.media,
    required this.numberOfItems,
    required this.goToItem,
    required this.onRemoved,
  });

  final Media media;
  final int numberOfItems;
  final void Function(int index, {bool resetTimer}) goToItem;
  final void Function() onRemoved;

  @override
  State<_HomeCarouselActions> createState() => _HomeCarouselActionsState();
}

class _HomeCarouselActionsState extends State<_HomeCarouselActions> {
  bool isRemoveEntryLoading = false;
  bool _isToggleFavouriteLoading = false;

  bool get isToggleFavouriteLoading => _isToggleFavouriteLoading;

  set isToggleFavouriteLoading(bool value) {
    setState(() {
      _isToggleFavouriteLoading = value;
    });
  }

  bool get isFavourite => widget.media.anilistInfo.isFavourite == true;

  Widget _buildLoader(BuildContext context) => Container(
        padding: const EdgeInsets.all(2.0),
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          color: context.colorScheme.onPrimary,
          strokeWidth: 2.0,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (isToggleFavouriteLoading && state is HomeLoaded) {
          isToggleFavouriteLoading = false;
        }

        if (isRemoveEntryLoading && state is HomeLoaded) {
          isRemoveEntryLoading = false;
          widget.onRemoved();
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
          Tooltip(
            message: 'Move to Dropped list',
            child: FilledButton(
              onPressed: () {
                if (isRemoveEntryLoading) return;

                setState(() {
                  isRemoveEntryLoading = true;
                });

                BlocProvider.of<WatchListBloc>(context).add(
                  WatchListRemoveMedia(
                    widget.media.anilistInfo.id,
                  ),
                );
              },
              child: AnimatedCrossFade(
                firstChild: _buildLoader(context),
                secondChild: const Icon(
                  HugeIcons.strokeRoundedBookmarkMinus01,
                ),
                crossFadeState: isRemoveEntryLoading
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 200),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Tooltip(
            message: isFavourite ? 'Remove from favourite' : 'Add to favourite',
            child: FilledButton(
              onPressed: () {
                if (isToggleFavouriteLoading) return;

                isToggleFavouriteLoading = true;

                BlocProvider.of<WatchListBloc>(context).add(
                  WatchListToggleFavourite(
                    mediaId: widget.media.anilistInfo.id,
                  ),
                );
              },
              child: AnimatedCrossFade(
                firstChild: _buildLoader(context),
                secondChild: Icon(
                  isFavourite
                      ? Icons.favorite
                      : HugeIcons.strokeRoundedFavourite,
                  color: isFavourite ? Colors.red : null,
                ),
                crossFadeState: isToggleFavouriteLoading
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
