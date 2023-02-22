import 'package:flutter/material.dart';

class FadeOverlay extends ModalRoute<void> {
  final Widget child;
  final Future<void> Function() onClose;

  FadeOverlay({required this.child, required this.onClose});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => true;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            onPressed: () {
              onClose().then((value) => Navigator.pop(context));
            },
            child: const Text('Dismiss'),
          ),
          Expanded(
            child: child,
          ),
        ],
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
