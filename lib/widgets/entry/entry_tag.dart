import 'dart:ui';

import 'package:flutter/material.dart';

class EntryTag extends StatelessWidget {
  const EntryTag({
    super.key,
    required this.child,
    this.color = Colors.transparent,
    this.outline,
  });

  final Widget child;
  final Color color;
  final Color? outline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: outline == null
                  ? Theme.of(context).colorScheme.outline
                  : outline!,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 10.0,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
