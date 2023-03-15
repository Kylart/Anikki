import 'package:flutter/material.dart';

class EntryCardAction {
  final void Function(BuildContext context) callback;
  final String label;
  final IconData icon;

  EntryCardAction({
    required this.callback,
    this.label = '',
    required this.icon,
  });
}
