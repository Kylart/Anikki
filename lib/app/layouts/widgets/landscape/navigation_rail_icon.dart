import 'package:flutter/material.dart';

class AnikkiNavigationRailIcon extends StatefulWidget {
  const AnikkiNavigationRailIcon({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onPressed,
    required this.iconSize,
    required this.title,
    this.error,
  });

  /// Icon displayed by default
  final IconData icon;

  /// Icon displayed when `selected` is set to `true`
  final IconData selectedIcon;

  /// If the icon is selected or not
  final bool selected;

  /// Text to display under the icon
  final String title;

  /// If not null, will display a badge for error
  final String? error;

  /// Method to call when Icon is tapped
  final void Function() onPressed;

  /// Size of the icon
  final double iconSize;

  @override
  State<AnikkiNavigationRailIcon> createState() =>
      _AnikkiNavigationRailIconState();
}

class _AnikkiNavigationRailIconState extends State<AnikkiNavigationRailIcon> {
  final key = GlobalKey();
  final xOffset = 50;

  OverlayEntry? overlayEntry;

  void showOverlay() {
    removeOverlay();

    assert(overlayEntry == null);

    final box = key.currentContext?.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);
    final y = position.dy;
    final x = position.dx;

    overlayEntry = OverlayEntry(
      builder: (context) => SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: x + xOffset,
              top: y - (widget.iconSize / 2),
              child: SizedBox(
                child: Material(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: widget.error != null,
      child: InkWell(
        onTap: widget.onPressed,
        child: MouseRegion(
          onEnter: (event) => showOverlay(),
          onExit: (event) => removeOverlay(),
          child: Icon(
            key: key,
            widget.selected ? widget.selectedIcon : widget.icon,
            size: widget.iconSize,
            color:
                widget.selected ? Theme.of(context).colorScheme.primary : null,
          ),
        ),
      ),
    );
  }
}
