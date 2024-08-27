part of 'home_title_carousel.dart';

class _HomeTitleCarouselContainer extends StatelessWidget {
  const _HomeTitleCarouselContainer({
    required this.child,
    required this.minWidth,
  });

  final Widget child;
  final double minWidth;

  static const borderRadius = BorderRadius.all(
    Radius.circular(8.0),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      constraints: BoxConstraints(
        maxWidth: minWidth,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.3),
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: child,
        ),
      ),
    );
  }
}
