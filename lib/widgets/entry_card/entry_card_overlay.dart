import 'package:flutter/material.dart';

class EntryCardOverlay extends StatefulWidget {
  const EntryCardOverlay({
    super.key,
    required this.onExit,
    required this.width,
    required this.height,
    required this.onExpand,
    required this.child,
  });

  final void Function() onExit;
  final void Function(Size size) onExpand;
  final double width;
  final double height;
  final Widget child;

  @override
  State<EntryCardOverlay> createState() => _LibraryEntryCardOverlayState();
}

class _LibraryEntryCardOverlayState extends State<EntryCardOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  late double width = widget.width;
  late double height = widget.height;

  @override
  void initState() {
    super.initState();

    width = widget.width;
    height = widget.height;

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MouseRegion(
        onExit: (event) => widget.onExit(),
        child: ScaleTransition(
          scale: _animation,
          child: SizedBox(
            width: width,
            height: height,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
