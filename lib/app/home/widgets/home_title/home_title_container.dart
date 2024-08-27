part of 'home_title.dart';

class _HomeTitleContainer extends StatelessWidget {
  const _HomeTitleContainer({
    required this.child,
    required this.maxSize,
    required this.media,
  });

  final Widget child;
  final Size maxSize;
  final Media media;

  final borderRadius = const BorderRadius.all(
    Radius.circular(8.0),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...previousChildren.map(
                  (e) => Flexible(child: e),
                )
              ],
            ),
            if (currentChild != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: currentChild),
                ],
              ),
          ],
        );
      },
      child: Padding(
        key: ValueKey(media),
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              constraints: BoxConstraints(
                maxHeight: maxSize.height,
                maxWidth: maxSize.width,
              ),
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: context.colorScheme.surface.withOpacity(0.3),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
