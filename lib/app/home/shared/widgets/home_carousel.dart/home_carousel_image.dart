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
  });

  final int currentIndex;
  final int realIndex;
  final Duration itemAnimationDuration;
  final Size cardSize;
  final double reducedHeight;
  final MediaListEntry entry;
  final double itemAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: realIndex == currentIndex
          ? const EdgeInsets.only(right: 12.0)
          : const EdgeInsets.symmetric(horizontal: 12.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          duration: itemAnimationDuration,
          constraints: BoxConstraints(
            maxHeight:
                realIndex == currentIndex ? cardSize.height : reducedHeight,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                entry.media.coverImage ?? '',
              ),
            ),
          ),
          child: AspectRatio(
            aspectRatio: itemAspectRatio,
          ),
        ),
      ),
    );
  }
}
