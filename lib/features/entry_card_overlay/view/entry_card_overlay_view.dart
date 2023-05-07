import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/bloc/entry_card_overlay_bloc.dart';

class EntryCardOverlayView extends StatefulWidget {
  const EntryCardOverlayView({
    super.key,
    required this.child,
    required this.position,
    required this.size,
  });

  final Widget child;
  final Offset position;
  final Size size;

  @override
  State<EntryCardOverlayView> createState() =>
      _LibraryEntryCardOverlayViewState();
}

class _LibraryEntryCardOverlayViewState extends State<EntryCardOverlayView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx,
      top: widget.position.dy,
      child: MouseRegion(
        onExit: (event) => BlocProvider.of<EntryCardOverlayBloc>(context)
            .add(EntryCardOverlayClosed()),
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: widget.size.height,
            ),
            width: widget.size.width,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
