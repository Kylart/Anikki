part of 'home_carousel.dart';

class _HomeCarouselContainer extends StatelessWidget {
  const _HomeCarouselContainer({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.colorScheme.surface.withOpacity(0.2),
                context.colorScheme.surface.withOpacity(0.1),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
            ),
            border: Border.all(
              color: context.colorScheme.outline.withOpacity(0.1),
            ),
          ),
          child: child,
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: 500.ms,
        )
        .slideX(
          duration: 500.ms,
          end: 0,
          begin: 0.5,
        );
  }
}
