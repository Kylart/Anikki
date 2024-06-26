import 'dart:ui';

import 'package:flutter/material.dart';

class EntryTag extends StatelessWidget {
  const EntryTag({
    super.key,
    required this.child,
    this.color,
    this.outline,
    this.padding = const EdgeInsets.only(
      top: 5.0,
      bottom: 5.0,
      left: 10.0,
      right: 10.0,
    ),
    this.blurLevel = 40.0,
  });

  final Widget child;
  final Color? color;
  final Color? outline;
  final EdgeInsetsGeometry padding;
  final double blurLevel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurLevel, sigmaY: blurLevel),
          child: Container(
            decoration: BoxDecoration(
              color: color ??
                  Theme.of(context).colorScheme.surface.withOpacity(0.5),
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
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
