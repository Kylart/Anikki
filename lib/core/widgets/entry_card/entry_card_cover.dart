part of 'entry_card.dart';

class _EntryCardCover extends StatelessWidget {
  _EntryCardCover({
    required this.url,
    required this.animation,
    String? color,
  }) {
    this.color = color ?? '#0d0d0d';
  }

  /// Color used when loading the image from `url`
  late final String color;

  /// The URL of the image to use for this cover
  final String? url;

  final Animation animation;

  double get translationValue => animation.value * 150;

  @override
  Widget build(BuildContext context) {
    final image = url != null
        ? Image.network(
            url!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                color: hexToColor(color),
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

    return ShaderMask(
      blendMode: BlendMode.lighten,
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment(-0.8, 1),
          colors: [
            Colors.white60,
            Colors.transparent,
            Colors.transparent,
          ],
        ).createShader(
          Rect.fromLTRB(
            0,
            0,
            rect.width - translationValue,
            rect.height + translationValue,
          ),
        );
      },
      child: Container(
        child: image,
      ),
    );
  }
}
