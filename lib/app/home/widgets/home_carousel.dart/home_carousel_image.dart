part of 'home_carousel.dart';

class _HomeCarouselImage extends StatelessWidget {
  const _HomeCarouselImage({
    required this.currentIndex,
    required this.realIndex,
    required this.itemAnimationDuration,
    required this.cardSize,
    required this.reducedHeight,
    required this.entry,
    required this.itemAspectRatio,
    required this.goToItem,
  });

  final int currentIndex;
  final int realIndex;
  final Duration itemAnimationDuration;
  final Size cardSize;
  final double reducedHeight;
  final MediaListEntry entry;
  final double itemAspectRatio;
  final void Function(int index, {bool resetTimer}) goToItem;

  final radius = const Radius.circular(8.0);

  bool get expanded => realIndex == currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: expanded
          ? const EdgeInsets.only(right: 12.0)
          : const EdgeInsets.symmetric(horizontal: 12.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          duration: itemAnimationDuration,
          constraints: BoxConstraints(
            maxHeight: expanded ? cardSize.height : reducedHeight,
          ),
          decoration: BoxDecoration(
            borderRadius: expanded
                ? BorderRadius.only(
                    topLeft: radius,
                    topRight: radius,
                    bottomRight: radius,
                  )
                : BorderRadius.all(radius),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                entry.media.coverImage ?? '',
              ),
            ),
          ),
          child: InkWell(
            onTap: () => goToItem(realIndex),
            child: AspectRatio(
              aspectRatio: itemAspectRatio,
            ),
          ),
        ),
      ),
    );
  }
}
