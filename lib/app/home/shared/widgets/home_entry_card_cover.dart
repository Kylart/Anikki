part of 'home_entry_card.dart';

class _HomeEntryCardCover extends StatelessWidget {
  const _HomeEntryCardCover({
    required this.url,
    this.glossy = false,
  });

  /// The URL of the image to use for this cover
  final String? url;

  /// Whether to apply a glossy effect shader on the image
  final bool glossy;

  @override
  Widget build(BuildContext context) {
    final image = url != null
        ? Image.network(
            url!,
            fit: BoxFit.cover,
          )
        : Image.asset(
            'assets/images/placeholder.jpg',
            fit: BoxFit.cover,
          );

    if (!glossy) return image;

    return ShaderMask(
      blendMode: BlendMode.lighten,
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white12,
            Colors.white12,
            Colors.transparent
          ],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      child: image,
    );
  }
}
