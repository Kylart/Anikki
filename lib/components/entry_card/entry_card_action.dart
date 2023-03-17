import 'package:flutter/material.dart';

enum EntryCardActionType {
  action,
  divider,
}

class EntryCardAction {
  final void Function(BuildContext context) callback;
  final String label;
  final IconData icon;
  final EntryCardActionType type;

  EntryCardAction({
    required this.callback,
    this.label = '',
    this.type = EntryCardActionType.action,
    required this.icon,
  });
}

final entryCardDivider = EntryCardAction(
  callback: (_) {},
  icon: Icons.question_mark,
  type: EntryCardActionType.divider,
);
