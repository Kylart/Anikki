import 'dart:ui';

import 'package:flutter/material.dart';

class LayoutCard extends StatelessWidget {
  const LayoutCard({super.key, required this.child});

  final Widget child;

  final borderRadius = const BorderRadius.all(Radius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.brightness == Brightness.dark
            ? Colors.black.withOpacity(0.9)
            : Colors.white70,
        ),
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: child,
        ),
      ),
    );
  }
}
