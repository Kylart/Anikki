import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/core/helpers/notify.dart';

class NotConnectedIcon extends StatelessWidget {
  const NotConnectedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.notify(
          message: 'Cannot connect to the Internet',
          descritpion: 'Anikki will reconnect automatically whenever possible.',
          isError: true,
        );
      },
      tooltip: 'No internet connection',
      icon: Icon(
        Ionicons.warning_outline,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
