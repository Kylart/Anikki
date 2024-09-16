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

  Widget get gap => const SizedBox(
        width: 12.0,
      );

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
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(16.0),
              ),
            ),
            icon: const Icon(HugeIcons.strokeRoundedShuffle),
            label: const Text('Random'),
          ),
          gap,
          Tooltip(
            message: 'Move to Dropped list',
            child: IconButton.filled(
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
              icon: AnimatedCrossFade(
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
          gap,
          FavouriteButton(
            media: widget.media,
          ),
        ],
      ),
    );
  }
}
