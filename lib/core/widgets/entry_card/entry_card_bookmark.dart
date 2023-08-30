import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/core/widgets/entry/entry_tag.dart';

class EntryCardBookmark extends StatelessWidget {
  const EntryCardBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return EntryTag(
      color: Colors.black45,
      padding: const EdgeInsets.all(4.0),
      outline: Colors.transparent,
      child: Icon(
        Ionicons.bookmark_outline,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
