import 'package:flutter/material.dart';

class FadeOverlay extends ModalRoute<void> {
  final Widget child;
  final Future<void> Function()? onClose;

  FadeOverlay({required this.child, this.onClose});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get opaque => true;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.white;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  void dispose() async {
    if (onClose != null) await onClose!();
    super.dispose();
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.canvas,
      child: SafeArea(
        child: Center(
          child: child,
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
