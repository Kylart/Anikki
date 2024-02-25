import 'package:flutter/material.dart';

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({
    super.key,
    required this.open,
    required this.child,
  });

  final bool open;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
      height: double.infinity,
      width: open ? 500 : 0,
      child: Material(
        color: Colors.transparent,
        elevation: 20,
        child: AnimatedSwitcher(
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.topCenter,
              children: <Widget>[
                Row(
                  children: previousChildren
                      .map(
                        (e) => Expanded(child: e),
                      )
                      .toList(),
                ),
                if (currentChild != null)
                  Column(
                    children: [
                      Expanded(child: currentChild),
                    ],
                  ),
              ],
            );
          },
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
          ) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: child,
              ),
            );
          },
          duration: const Duration(milliseconds: 350),
          child: child,
        ),
      ),
    );
  }
}
