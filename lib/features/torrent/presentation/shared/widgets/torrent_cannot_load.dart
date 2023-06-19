import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/layout_card.dart';

class TorrentCannotLoad extends StatefulWidget {
  const TorrentCannotLoad({
    super.key,
    required this.type,
  });

  final TorrentType type;

  @override
  State<TorrentCannotLoad> createState() => _TorrentCannotLoadState();
}

class _TorrentCannotLoadState extends State<TorrentCannotLoad> {
  bool dismissed = false;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: dismissed,
      child: LayoutCard(
        child: ListTile(
          dense: true,
          title: Text('Could not find ${widget.type.title()} instance'),
          subtitle: Text(
            'Are you sure your ${widget.type.title()} is running and accepting connections?',
          ),
          trailing: IconButton(
            onPressed: () => setState(() {
              dismissed = true;
            }),
            icon: const Icon(Icons.close),
          ),
        ),
      ),
    );
  }
}
