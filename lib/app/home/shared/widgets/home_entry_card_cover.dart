part of 'home_entry_card.dart';

class _HomeEntryCardCover extends StatelessWidget {
  const _HomeEntryCardCover({
    required this.url,
    this.color = '#0d0d0d',
    this.glossy = false,
  });

  /// Color used when loading the image from `url`
  final String? color;

  /// The URL of the image to use for this cover
  final String? url;

  /// Whether to apply a glossy effect shader on the image
  final bool glossy;

  Color get hexColor {
    final buffer = StringBuffer();
    if (color?.length == 6 || color?.length == 7) buffer.write('ff');
    buffer.write(color?.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final image = url != null
        ? Image.network(
            url!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                color: hexColor,
                child: const AspectRatio(
                  aspectRatio: 11 / 16,
                ),
              );
            },
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
