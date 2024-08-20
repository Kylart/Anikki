part of 'home_carousel.dart';

class _HomeCarouselActions extends StatelessWidget {
  const _HomeCarouselActions({
    required this.media,
    required this.numberOfItems,
    required this.goToItem,
  });

  final Media media;
  final int numberOfItems;
  final void Function(int index, {bool resetTimer}) goToItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilledButton.tonalIcon(
          onPressed: () => goToItem(
            Random().nextInt(numberOfItems - 1),
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
          onPressed: () {},
          child: Icon(
            media.anilistInfo.isFavourite == true
                ? Icons.favorite
                : HugeIcons.strokeRoundedFavourite,
            color: media.anilistInfo.isFavourite == true ? Colors.red : null,
          ),
        ),
      ],
    );
  }
}
