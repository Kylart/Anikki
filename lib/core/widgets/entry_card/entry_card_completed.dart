import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/core/widgets/entry/entry_tag.dart';

class EntryCardCompleted extends StatelessWidget {
  const EntryCardCompleted({
    super.key,
    this.dense = false,
  });

  final bool dense;

  @override
  Widget build(BuildContext context) {
    return EntryTag(
      color: Colors.black45,
      padding: const EdgeInsets.all(4.0),
      outline: Colors.transparent,
      child: Icon(
        Ionicons.checkmark_done_outline,
        color: Colors.green,
        size: dense ? 18.0 : null,
      ),
    );
  }
}
