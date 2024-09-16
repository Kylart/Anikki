import 'package:flutter/material.dart';

class DrawerContainerOld extends StatelessWidget {
  const DrawerContainerOld({
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
          duration: const Duration(milliseconds: 350),
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
              child: child,
            );
          },
          child: child,
        ),
      ),
    );
  }
}
