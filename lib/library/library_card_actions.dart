import 'package:flutter/material.dart';

import 'package:anikki/components/user_list/user_list_actions.dart';
import 'package:anikki/components/shared/entry_card/entry_card_action.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/models/local_file.dart';

class LocalCardActions extends StatelessWidget {
  const LocalCardActions(
      {super.key, required this.onBack, required this.entry});

  final void Function() onBack;
  final LocalFile entry;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.75,
      children: [
        EntryCardAction(
          icon: Icons.play_arrow,
          onTap: () async => await playFile(entry, context),
        ),
        if (isDesktop())
          EntryCardAction(
            icon: Icons.download,
            onTap: () => download<LocalFile>(context, entry),
          ),
        if (!isDesktop())
          EntryCardAction(
            icon: Icons.chevron_left,
            onTap: onBack,
          ),
        EntryCardAction(
          icon: Icons.delete,
          iconColor: Theme.of(context).colorScheme.error,
          hoverColor: Theme.of(context).colorScheme.errorContainer,
          onTap: () async => await deleteFile(entry, context),
        ),
        const EntryCardAction(icon: Icons.more_horiz),
      ],
    );
  }
}
