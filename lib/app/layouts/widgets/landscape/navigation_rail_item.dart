part of 'navigation_rail.dart';

class _NavigationRailItem extends StatefulWidget {
  _NavigationRailItem({
    required this.text,
    required this.expanded,
    this.onClick,
    this.icon,
    this.imageUrl,
    this.isTitle = false,
    this.selected = false,
  }) {
    // Should give at least an icon or an image but not both at the same time.
    assert(
      (icon != null && imageUrl == null) || (imageUrl != null && icon == null),
    );
  }

  final String text;

  final bool expanded;

  final void Function()? onClick;

  final IconData? icon;
  final String? imageUrl;

  final bool isTitle;
  final bool selected;

  @override
  State<_NavigationRailItem> createState() => _NavigationRailItemState();
}

class _NavigationRailItemState extends State<_NavigationRailItem>
    with SingleTickerProviderStateMixin {
  bool hovered = false;

  Widget _buildIcon(IconData icon) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Icon(
          icon,
          size: 20,
          color: widget.selected ? context.colorScheme.primary : null,
        ),
      );

  Widget _buildImage(String imageUrl) => Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: CircleAvatar(
          backgroundImage: imageUrl.startsWith('http')
              ? CachedNetworkImageProvider(imageUrl)
              : AssetImage(imageUrl),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onClick != null) widget.onClick!();
      },
      child: MouseRegion(
        onEnter: (event) => setState(() {
          hovered = true;
        }),
        onHover: (event) => setState(() {
          hovered = true;
        }),
        onExit: (event) => setState(() {
          hovered = false;
        }),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              if (widget.icon != null) _buildIcon(widget.icon!),
              if (widget.imageUrl != null) _buildImage(widget.imageUrl!),
              if (widget.expanded)
                Expanded(
                  child: AnimatedPadding(
                    duration: const Duration(milliseconds: 150),
                    padding: EdgeInsets.only(
                      left: hovered && !widget.isTitle ? 16.0 : 8.0,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            widget.text,
                            style: (widget.isTitle
                                    ? context.textTheme.labelLarge
                                    : context.textTheme.bodyMedium)
                                ?.copyWith(
                              color: widget.selected
                                  ? context.colorScheme.primary
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animate().fade(
                      begin: widget.expanded ? 0 : 1,
                      end: widget.expanded ? 1 : 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
