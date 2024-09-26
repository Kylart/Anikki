import 'package:flutter/material.dart';

const borderRadius = BorderRadius.all(
  Radius.circular(20),
);

class LayoutCard extends StatelessWidget {
  const LayoutCard({
    super.key,
    required this.child,
    this.transparent = false,
  });

  final Widget child;
  final bool transparent;

  @override
  Widget build(BuildContext context) {
    final color = transparent ? Colors.transparent : null;

    return Card(
      color: color,
      shadowColor: color,
      surfaceTintColor: color,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}
