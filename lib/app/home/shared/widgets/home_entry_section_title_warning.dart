import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeEntrySectionTitleWarning extends StatelessWidget {
  const HomeEntrySectionTitleWarning({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      preferBelow: false,
      child: Icon(
        Ionicons.warning_outline,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
