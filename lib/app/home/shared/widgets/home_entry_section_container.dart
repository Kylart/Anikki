import 'package:flutter/material.dart';

class HomeEntrySectionContainer extends StatelessWidget {
  const HomeEntrySectionContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: child,
    );
  }
}
