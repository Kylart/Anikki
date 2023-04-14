import 'package:flutter/material.dart';

import 'package:anikki/widgets/entry/entry_tag.dart';

class EntryCardCompleted extends StatelessWidget {
  const EntryCardCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return const EntryTag(
      color: Colors.black45,
      padding: EdgeInsets.all(4.0),
      outline: Colors.transparent,
      child: Icon(
        Icons.done_all,
        color: Colors.green,
      ),
    );
  }
}
