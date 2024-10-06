part of 'home_carousel.dart';

class _HomeCarouselContainer extends StatelessWidget {
  const _HomeCarouselContainer({
    required this.child,
  });

  final Widget child;

  BorderSide _getBorder(BuildContext context) => BorderSide(
        color: context.colorScheme.outline.withOpacity(0.1),
      );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.colorScheme.surface.withOpacity(0.3),
                context.colorScheme.surface.withOpacity(0.2),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
            ),
            border: Border(
              top: _getBorder(context),
              left: _getBorder(context),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
