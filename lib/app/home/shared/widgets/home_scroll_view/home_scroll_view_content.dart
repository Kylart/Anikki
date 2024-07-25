part of 'home_scroll_view.dart';

class _HomeScrollViewContent extends StatefulWidget {
  const _HomeScrollViewContent({
    required this.medias,
    required this.scrollController,
    this.customTagsBuilder,
  });

  final List<Media> medias;
  final ScrollController scrollController;
  final List<String> Function(Media media)? customTagsBuilder;

  @override
  State<_HomeScrollViewContent> createState() => _HomeScrollViewContentState();
}

class _HomeScrollViewContentState extends State<_HomeScrollViewContent> {
  int? currentlyHoveredId;

  Future<void> setCurrentlyExpandedEntry(BuildContext context, int? id) async {
    setState(() {
      currentlyHoveredId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final (index, media) in widget.medias.indexed)
          Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 32.0,
            ),
            child: InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => setCurrentlyExpandedEntry(
                context,
                media.anilistInfo.id == currentlyHoveredId
                    ? null
                    : media.anilistInfo.id,
              ),
              child: MouseRegion(
                onEnter: (event) => setCurrentlyExpandedEntry(
                  context,
                  media.anilistInfo.id,
                ),
                onExit: (event) => setCurrentlyExpandedEntry(context, null),
                child: HomeEntry(
                  media: media,
                  expanded: currentlyHoveredId == media.anilistInfo.id,
                  customTags: widget.customTagsBuilder != null
                      ? widget.customTagsBuilder!(media)
                      : const [],
                  onExpanded: (key) {
                    widget.scrollController.position.ensureVisible(
                      key.currentContext!.findRenderObject()!,
                      alignmentPolicy:
                          ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
