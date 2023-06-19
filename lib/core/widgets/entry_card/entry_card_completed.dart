import 'package:flutter/material.dart';

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
        Icons.done_all,
        color: Colors.green,
        size: dense ? 18.0 : null,
      ),
    );
  }
}
