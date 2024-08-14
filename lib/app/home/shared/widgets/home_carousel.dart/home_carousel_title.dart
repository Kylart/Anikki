part of 'home_carousel.dart';

class _HomeCarouselTitle extends StatelessWidget {
  const _HomeCarouselTitle({
    required this.currentMedia,
  });

  final Media currentMedia;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.topCenter,
          children: <Widget>[
            Row(
              children: [
                ...previousChildren.map(
                  (e) => Flexible(child: e),
                )
              ],
            ),
            if (currentChild != null)
              Row(
                children: [
                  Expanded(child: currentChild),
                ],
              ),
          ],
        );
      },
      child: Text(
        key: ValueKey<int>(currentMedia.anilistInfo.id),
        currentMedia.title ?? '',
        style: context.textTheme.bodyLarge,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
      ),
    );
  }
}
