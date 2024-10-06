part of 'home_title.dart';

class _HomeTitleContainer extends StatelessWidget {
  const _HomeTitleContainer({
    required this.child,
    required this.maxSize,
    required this.minWidth,
  });

  final Widget child;
  final Size maxSize;
  final double minWidth;

  final borderRadius = const BorderRadius.all(
    Radius.circular(8.0),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              minWidth: minWidth,
            ),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: context.colorScheme.surface.withOpacity(0.3),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
