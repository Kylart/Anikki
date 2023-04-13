import 'package:flutter/material.dart';

import 'package:anikki/widgets/glass_circle.dart';

class EntryCardBookmark extends StatelessWidget {
  const EntryCardBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCircle(
      child: Container(
        width: 35,
        height: 35,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: Center(
          child: Icon(
            Icons.bookmark_added_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
