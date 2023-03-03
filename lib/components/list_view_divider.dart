import 'package:flutter/material.dart';

class ListViewDivider extends StatelessWidget {
  const ListViewDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
      height: 3.0,
    );
  }
}
