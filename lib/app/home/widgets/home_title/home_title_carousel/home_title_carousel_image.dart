part of 'home_title_carousel.dart';

class _HomeTitleCarouselImage extends StatefulWidget {
  const _HomeTitleCarouselImage({
    required this.backdrop,
    required this.selected,
  });

  final bool selected;
  final Backdrop backdrop;

  @override
  State<_HomeTitleCarouselImage> createState() =>
      _HomeTitleCarouselImageState();
}

class _HomeTitleCarouselImageState extends State<_HomeTitleCarouselImage> {
  bool _hovered = false;

  bool get hovered => _hovered;

  set hovered(bool value) {
    setState(() {
      _hovered = value;
    });
  }

  Color getBorderColor(BuildContext context) {
    return widget.selected
        ? context.colorScheme.secondary
        : hovered
            ? context.colorScheme.secondary.withOpacity(0.7)
            : context.colorScheme.outline.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.backdrop.filePath == null) return;

        BlocProvider.of<HomeBloc>(context).add(
          HomeCurrentBackgroundUrlChanged(
            getTmdbImageUrl(widget.backdrop.filePath!),
          ),
        );
      },
      child: MouseRegion(
        onEnter: (event) => hovered = true,
        onHover: (event) => hovered = true,
        onExit: (event) => hovered = false,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: _HomeTitleCarouselContainer.borderRadius,
            border: Border.all(
              color: getBorderColor(context),
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: _HomeTitleCarouselContainer.borderRadius,
            child: Image.network(
              'https://image.tmdb.org/t/p/original${widget.backdrop.filePath}',
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.blueGrey,
                    ),
                  )
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .fadeIn(duration: 1.2.seconds)
                      .fadeOut(delay: 300.ms, duration: 1.2.seconds);
                }

                return child;
              },
            ),
          ),
        ),
      ),
    );
  }
}
