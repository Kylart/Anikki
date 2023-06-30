import 'package:flutter/material.dart';

class LayoutCard extends StatelessWidget {
  const LayoutCard({
    super.key,
    required this.child,
    this.transparent = false,
  });

  final Widget child;
  final bool transparent;

  final borderRadius = const BorderRadius.all(
    Radius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    final color = transparent ? Colors.transparent : null;

    return Card(
      color: color,
      shadowColor: color,
      surfaceTintColor: color,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: transparent
              ? null
              : Border.all(
                  color: Theme.of(context).dividerColor,
                ),
        ),
        child: child,
      ),
    );
  }
}
