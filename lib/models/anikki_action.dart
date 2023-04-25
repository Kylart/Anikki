import 'package:flutter/material.dart';

enum AnikkiActionType {
  action,
  divider,
}

class AnikkiAction {
  final String label;
  final IconData icon;
  final Widget? trailing;
  final void Function(BuildContext context) callback;
  final AnikkiActionType type;
  final bool disabled;

  AnikkiAction({
    required this.label,
    this.trailing,
    required this.callback,
    this.icon = Icons.question_mark,
    this.type = AnikkiActionType.action,
    this.disabled = false,
  });
}
