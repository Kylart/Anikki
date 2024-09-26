import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';

class LayoutCard extends StatelessWidget {
  const LayoutCard({
    super.key,
    required this.child,
  });

  final Widget child;

  static const borderRadius = BorderRadius.all(
    Radius.circular(12.0),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: context.colorScheme.surface,
      ),
      child: child,
    );
  }
}
