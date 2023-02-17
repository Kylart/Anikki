import 'package:flutter/material.dart';

import 'package:kawanime/components/user_list/user_list_actions.dart';
import 'package:kawanime/components/shared/grid_card_action.dart';
import 'package:kawanime/helpers/desktop_hooks.dart';
import 'package:kawanime/providers/local/types/file.dart';

class LocalCardActions extends StatelessWidget {
  const LocalCardActions(
      {super.key, required this.onBack, required this.entry});

  final void Function() onBack;
  final LocalFile entry;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.75,
      children: [
        GridCardAction(
          icon: Icons.play_arrow,
          onTap: () async => await playFile(entry, context),
        ),
        if (isDesktop()) const GridCardAction(icon: Icons.edit),
        if (!isDesktop())
          GridCardAction(
            icon: Icons.chevron_left,
            onTap: onBack,
          ),
        GridCardAction(
          icon: Icons.delete,
          iconColor: Theme.of(context).colorScheme.error,
          hoverColor: Theme.of(context).colorScheme.errorContainer,
          onTap: () async => await deleteFile(entry, context),
        ),
        const GridCardAction(icon: Icons.more_horiz),
      ],
    );
  }
}
