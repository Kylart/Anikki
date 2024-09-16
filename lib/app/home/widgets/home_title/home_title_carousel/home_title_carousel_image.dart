part of 'home_title_carousel.dart';

class _HomeTitleCarouselImage extends StatefulWidget {
  const _HomeTitleCarouselImage({
    required this.url,
    required this.selected,
  });

  final bool selected;
  final String url;

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
        BlocProvider.of<HomeBloc>(context).add(
          HomeCurrentBackgroundUrlChanged(
            widget.url,
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
            borderRadius: HomeTitleCarouselContainer.borderRadius,
            border: Border.all(
              color: getBorderColor(context),
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: HomeTitleCarouselContainer.borderRadius,
            child: CachedNetworkImage(
              imageUrl: widget.url,
              errorWidget: (context, error, stackTrace) {
                return const SizedBox();
              },
              placeholder: (context, childurl) {
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
