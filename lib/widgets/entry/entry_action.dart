import 'package:flutter/material.dart';

enum EntryActionType {
  action,
  divider,
}

class EntryAction {
  final void Function(BuildContext context) callback;
  final String label;
  final IconData icon;
  final EntryActionType type;

  EntryAction({
    required this.callback,
    this.label = '',
    this.type = EntryActionType.action,
    required this.icon,
  });
}

final entryCardDivider = EntryAction(
  callback: (_) {},
  icon: Icons.question_mark,
  type: EntryActionType.divider,
);
