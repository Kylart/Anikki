import 'package:flutter/material.dart';

class LayoutCard extends StatelessWidget {
  const LayoutCard({super.key, required this.child});

  final Widget child;

  final borderRadius = const BorderRadius.all(
    Radius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: child,
      ),
    );
  }
}
